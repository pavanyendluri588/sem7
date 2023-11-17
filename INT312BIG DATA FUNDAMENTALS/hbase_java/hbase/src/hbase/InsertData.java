package hbase;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.TableName;




import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.Admin;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.util.Bytes;



import java.io.IOException;
public class InsertData{
	public static void main(String args[]) throws IOException {
		
		Configuration conf =  HBaseConfiguration.create();
		Connection conn = ConnectionFactory.createConnection(conf);
		
		Admin admin = conn.getAdmin();
		Table tb1 = conn.getTable(TableName.valueOf("tb1"));
		Put put = new Put(Bytes.toBytes("1"));
		put.addColumn(Bytes.toBytes("cf1"),Bytes.toBytes("name"),Bytes.toBytes("pavan"));
		put.addColumn(Bytes.toBytes("cf2"),Bytes.toBytes("employeeid"),Bytes.toBytes("1"));
		
		tb1.put(put);
		System.out.println("data indertion is completed");
		
		
		
	}
	
}
