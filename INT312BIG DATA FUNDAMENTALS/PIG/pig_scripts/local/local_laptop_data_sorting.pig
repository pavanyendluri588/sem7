--loading the data
cd D:\datasets
A = load 'laptopData.csv' using PigStorage(',') as (Unnamed:int,Company:chararray,TypeName:chararray,Inches:float,ScreenResolution:charArray,Cpu:chararray,Ram:charArray,Memory:chararray,Gpu:chararray,OpSys:chararray,Weight:chararray,Price:float);
--dumping the data
dump A;
describe A 
-- sorting in desending order by unnamed
B = order A by Unnamed DESC;
dump B;

--storing the data
cd D:\datasets
store B into 'pig_data_processed' using PigStorage(',');
--'\' 
--store B into 'pig_data_processed' using PigStorage(',');