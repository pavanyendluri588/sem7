package hbase;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.Admin;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HBaseConfiguration;

import java.io.IOException;
public class CreateTable {
	public static void main(String args[]) throws IOException {
		Configuration conf = HBaseConfiguration.create();
		Connection con = ConnectionFactory.createConnection(conf);
		
		Admin admin = con.getAdmin();
		
		HTableDescriptor tb1 =   new HTableDescriptor(TableName.valueOf("myapitable"));
		
		tb1.addFamily(new HColumnDescriptor("cf1"));
		tb1.addFamily(new HColumnDescriptor("cf2"));
		
	     if (!admin.tableExists(tb1.getTableName())) {
	    	 System.out.println("table creation is started");
	    	 admin.createTable(tb1);
	    	 System.out.println("table created");
	     }
		
	}

}


/*
package hbase;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.Admin;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HBaseConfiguration;

import java.io.IOException;
public class CreateTable {
	//creating the congiguraction  to the hbase 
	public static void main(String args[])  throws IOException {
	Configuration config = HBaseConfiguration.create();

	//creating the connection 
	Connection connection1 = ConnectionFactory.createConnection(config);  // throw the IOException
	
	
	
	//getting the admin connection 
	Admin admin = connection1.getAdmin();
	
	//creating the table in teh hbase 
	HTableDescriptor tb1 = new HTableDescriptor(TableName.valueOf("myjavaapitable"));
	
	//adding the column family
	tb1.addFamily( new HColumnDescriptor("colfamily1"));
	
	tb1.addFamily(new HColumnDescriptor("colfamily2"));
	System.out.println("checking for the y=table if it exists:\n" + admin.tableExists(TableName.valueOf("myjavaapitable")));
	
	if (!admin.tableExists(TableName.valueOf("myjavaapitable"))) {
		//table creation is started 
		System.out.println("Table Creation started");
		admin.createTable(tb1);
		System.out.println("Table Creation completed");
	}
	
	
	

	}

}


*/
