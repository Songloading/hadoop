%declare DATE `date +%Y-%m-%d`
REGISTER 'Lab5Blogs-0.0.1-SNAPSHOT.jar';
DEFINE FILT edu.rosehulman.luos.CheckBlog();
DEFINE COMPUTE edu.rosehulman.luos.Compute();
DEFINE FORM edu.rosehulman.luos.Formatize();
records = LOAD '$original' using PigStorage('\t') AS (date:chararray, time:chararray, x_edge_location:chararray, sc_bytes:int, c_ip:chararray, cs_method:chararray, csHost:chararray, cs_uri_stem:chararray, sc_status:int, csReferer:chararray, csUser_Agent:chararray, cs_uri_query:chararray, csCookie:chararray, x_edge_result_type:chararray, x_edge_request_id:chararray);

filtered = FILTER records BY FILT(cs_uri_stem);
ok = FOREACH filtered GENERATE cs_uri_stem, FLATTEN(STRSPLIT(cs_uri_stem, '/', 4)) as (empty:chararray,blog:chararray,name:chararray,extra:chararray), x_edge_result_type;
useful = FOREACH ok GENERATE name, x_edge_result_type;

groupeName = GROUP useful BY name;
base = FOREACH groupeName GENERATE group, COUNT(useful) as total;

hitsRecord = FILTER useful BY x_edge_result_type == 'Hit';
errorRecord = FILTER useful BY x_edge_result_type == 'Error';
allHits = GROUP hitsRecord BY name;
allErrors = GROUP errorRecord BY name;

hitsCount = FOREACH allHits GENERATE group, COUNT(hitsRecord) as hits;
errorCount = FOREACH allErrors GENERATE group, COUNT(errorRecord) as errors;

hitsJoin = JOIN base BY group LEFT OUTER, hitsCount BY group;
errornhits = JOIN hitsJoin BY base::group LEFT OUTER, errorCount BY group;
ratios = FOREACH errornhits GENERATE hitsJoin::base::group as BlogName, COMPUTE(hits,total) as HitRatio, COMPUTE(errors, total) as ErrorRatio, CurrentTime() as time;

result = FOREACH ratios GENERATE BlogName, HitRatio, ErrorRatio,GetYear(time) as year, GetMonth(time) as month, GetDay(time) as day, GetHour(time) as hour;

STORE result INTO '$outputdir//$DATE';