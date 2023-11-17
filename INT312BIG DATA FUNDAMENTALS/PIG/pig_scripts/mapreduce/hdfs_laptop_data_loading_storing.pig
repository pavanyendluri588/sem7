--hadoop fs -put "D:\sem7\INT312BIG DATA FUNDAMENTALS\PIG\pig_scripts\mapreduce\hdfs_laptop_data_loading_storing.pig" "/pig/pig_scripts/"
--loading the data
A = load 'hdfs://localhost:9000/pig/datasets/laptopData.csv' using PigStorage(',');
--dumping the data
dump A;
--storing the data
store A into 'hdfs://localhost:9000/pig/store/laptop_data_processed/' using PigStorage(',');
