package hbase;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.client.Delete;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.util.Bytes;


import java.io.IOException;
public class DeleteData {
    public static void main(String args[]) throws IOException {
    	//creating the configuration for the hbase 
    	Configuration conf = HBaseConfiguration.create();
    	//creating the connection using the configuraction 
    	Connection connection1 = ConnectionFactory.createConnection(conf);
    	
    	//geting thee table coonnection 
    	Table tb1 = connection1.getTable(TableName.valueOf("mytabel"));
    	
    	
    	//deleting the row 1 
        Delete delete =new  Delete(Bytes.toBytes("1"));
        
        delete.addColumn(Bytes.toBytes("colf1"),Bytes.toBytes("column_name"));
        
        tb1.delete(delete);
        tb1.close();
        
    	
    	
    	
    	
    	
    	
    	
    }
}
