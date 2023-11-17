package hbase;
//for configuraction
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
//for connection
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Connection;
//for table 
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Table;
//for the result 
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.util.Bytes;

//importing the IOException
import java.io.IOException;
//getting the data 
import org.apache.hadoop.hbase.client.Get;
public class RetrivingData {
	public static void main(String args[]) throws IOException {
	//cfeating the confihguraction
	Configuration conf = HBaseConfiguration.create();
	
	//creation the connection
	Connection connection = ConnectionFactory.createConnection(conf); 
	
	Table tb1 = connection.getTable(TableName.valueOf("mytable"));
	
	Get get1 = new Get(Bytes.toBytes("1"));
	
	Result result1 = tb1.get(get1);
	
	byte[] value1 = result1.getValue(Bytes.toBytes("colfammily1"),Bytes.toBytes("colname"));
	byte[] value2 = result1.getValue(Bytes.toBytes("colfammily1"),Bytes.toBytes("colname2"));
	
	String col1 = Bytes.toString(value1);
	
	
	
	}
}
