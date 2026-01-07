using System.Data;
using System.Data.SqlClient;
using System.Configuration; // 确保添加了此命名空间

public class DBHelper
{
    private static string connString = ConfigurationManager.ConnectionStrings["SqlConn"].ConnectionString;

    // 执行增、删、改操作
    public static int ExecuteNonQuery(string sql, params SqlParameter[] parameters)
    {
        using (SqlConnection conn = new SqlConnection(connString))
        {
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddRange(parameters);
            conn.Open();
            return cmd.ExecuteNonQuery();
        }
    }

    // 执行查询，返回第一行第一列（用于登录验证、统计人数）
    public static object ExecuteScalar(string sql, params SqlParameter[] parameters)
    {
        using (SqlConnection conn = new SqlConnection(connString))
        {
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddRange(parameters);
            conn.Open();
            return cmd.ExecuteScalar();
        }
    }

    // 执行查询，返回 DataTable（用于列表展示）
    public static DataTable ExecuteDataTable(string sql, params SqlParameter[] parameters)
    {
        using (SqlConnection conn = new SqlConnection(connString))
        using (SqlCommand cmd = new SqlCommand(sql, conn))
        {
            cmd.Parameters.AddRange(parameters);
            using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
            {
                DataTable table = new DataTable();
                adapter.Fill(table);
                return table;
            }
        }
    }
}
