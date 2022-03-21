/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import com.microsoft.sqlserver.jdbc.SQLServerDataSource;
import com.microsoft.sqlserver.jdbc.SQLServerException;
import java.sql.Connection;

/**
 *
 * @author crrtt
 */
public class DB {
    public static Connection getConnection() throws SQLServerException{
        SQLServerDataSource ds = new SQLServerDataSource();
        ds.setServerName("DESKTOP-M6PUB4I");
        ds.setUser("sa");
        ds.setPassword("123456");
        ds.setDatabaseName("RAUCU");
        ds.setPortNumber(1433);
        return ds.getConnection();
    }
}
