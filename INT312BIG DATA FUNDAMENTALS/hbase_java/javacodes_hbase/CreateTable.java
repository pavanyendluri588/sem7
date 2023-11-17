package hbase;


import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.*;

import java.io.IOException;


public class CreateTable {

	public static  void main(String[] args) throws IOException {
		Configuration conf=HBaseConfiguration.create();
		/*
		conf.addResource("core-site.xml");
		conf.addResource("hbase-site.xml");
		conf.addResource("hdfs-site.xml");
		conf.set("zookeeper.znode.parent", "/hbase-secure");       
		conf.set("hbase.zookeeper.property.clientPort", "2181");
		 
		 */
		
		Connection connection = ConnectionFactory.createConnection(conf);
		
		Admin admin=connection.getAdmin();

		HTableDescriptor tableName= new HTableDescriptor(TableName.valueOf("mytable"));
		
		tableName.addFamily(new HColumnDescriptor("colfam1"));

		tableName.addFamily(new HColumnDescriptor("colfam2"));

		if (!admin.tableExists(tableName.getTableName())){
			System.out.print("Creating Table.");
			admin.createTable(tableName);
			System.out.println("Done");
		}
	}
	
	
	
}
