--loading the data
cd D:\datasets
A = load 'laptopData.csv' using PigStorage(',') as (Unnamed:int,Company:chararray,TypeName:chararray,Inches:float,ScreenResolution:charArray,Cpu:chararray,Ram:charArray,Memory:chararray,Gpu:chararray,OpSys:chararray,Weight:chararray,Price:float);
--dumping the data
dump A;
describe A 
-- grouping all
B = group A ALL;
dump B;
describe B;
-- selecting columns
C = foreach B generate COUNT(A.TypeName);
-- ,CONCAT((chararray)Unnamed,(chararray)Company,(chararray)TypeName)
--dumping the data
--dump C;

--storing the data
cd D:\datasets
store C into 'pig_data_processed' using PigStorage(',');
--'\' 
--store B into 'pig_data_processed' using PigStorage(',');