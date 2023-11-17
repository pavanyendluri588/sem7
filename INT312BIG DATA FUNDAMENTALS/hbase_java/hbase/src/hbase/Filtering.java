package hbase;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.client.Scan;

import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.RowFilter;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.hadoop.hbase.filter.CompareFilter;
import org.apache.hadoop.hbase.filter.BinaryComparator;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Result;

import org.apache.hadoop.hbase.util.Bytes;


import java.io.IOException;

public class Filtering {
	
	public static void main(String args[]) throws IOException {
	
		Configuration conf = HBaseConfiguration.create();
		Connection conn =ConnectionFactory.createConnection(conf);
		
		/*
		 * all the filters are subclass of the filter  abstract class
		 * 
		 * row id:
		 * FILTER (BASE CLASS) ==> FILTERBASE ==> COMPAREFILTER ==> ROWFILTER
		 * 
		 * COMPAREFILTER  contain 2 values :
		 * 1.OPERATOR
		 * 2.COMPARATOR OBJECT - the objects whill will compare the  with specific value 
		 * 
		 * COMPAREFILTER (operator):
		 * LESS,GREATER,EQUAL,NOT_EQUAL,LESS_OR_EQUAL,GREATER_OR_EQUAL,
		 * 
		 * 
		 * 
		 * */
		
		//acaning for the row id 2 
		Table tb1 = conn.getTable(TableName.valueOf("tb1"));
		
		
		Filter filter  = new RowFilter(CompareFilter.CompareOp.EQUAL,new BinaryComparator(Bytes.toBytes("1")));
		
		Scan  scan = new Scan();
		scan.setFilter(filter);
		 ResultScanner scan_results = tb1.getScanner(scan);
		 for (Result i: scan_results) {
			 System.out.println("result:" + i);
		 }
		 scan_results.close();
		
		
		
	}

}
