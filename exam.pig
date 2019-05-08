REGISTER 'hdfs:///tmp/Exams/luosUDF.jar';
DEFINE CONCATENATE edu.rosehulman.luos.NameConcatenator();
DEFINE CONVERT edu.rosehulman.luos.ScoreConverter();
grades = LOAD '$gradeInput' using PigStorage('\t') AS (fname: chararray, lname: chararray, course: chararray, score: int);
courses = LOAD '$courseInput' using PigStorage('\t') AS (course_number: chararray, course_name: chararray);

filteredgrades = FILTER grades by score<=90;
join_table = JOIN filteredgrades BY course LEFT OUTER, courses BY course_number;

result = FOREACH join_table GENERATE CONCATENATE(fname, lname), course_number, course_name, CONVERT(score);

STORE result INTO '$pigOutput/$username' using PigStorage('\t')



