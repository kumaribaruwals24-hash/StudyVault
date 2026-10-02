using System.Data.SqlClient;

namespace STUDYVAULT
{
    public class DatabaseHelper
    {
        private static string connectionString =
            @"Data Source=SMRITI\SQLEXPRESS02;Initial Catalog=StudyVaultDB;Integrated Security=True;TrustServerCertificate=True";

        public static SqlConnection GetConnection()
        {
            return new SqlConnection(connectionString);
        }
    }
}