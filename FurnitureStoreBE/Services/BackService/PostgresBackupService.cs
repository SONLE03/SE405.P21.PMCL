using System.Diagnostics;

namespace FurnitureStoreBE.Services.BackService
{
    public class PostgresBackupService : IBackupService
    {
        private readonly IConfiguration _configuration;

        public PostgresBackupService(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task BackupDatabaseAsync()
        {
            var connectionString = _configuration.GetConnectionString("DefaultConnection");

            var builder = new Npgsql.NpgsqlConnectionStringBuilder(connectionString);

            string dbName = builder.Database;
            string username = builder.Username;
            string password = builder.Password;
            string host = builder.Host;
            string port = builder.Port.ToString();

            string backupFolder = @"D:\Backups";
            if (!Directory.Exists(backupFolder))
            {
                Directory.CreateDirectory(backupFolder);
            }

            string backupFile = Path.Combine(backupFolder, $"backup_{DateTime.Now:yyyyMMdd_HHmmss}.sql");

            string arguments = $"-h {host} -p {port} -U {username} -v --inserts -f \"{backupFile}\" {dbName}";

            var process = new Process
            {
                StartInfo = new ProcessStartInfo
                {
                    FileName = "pg_dump",
                    Arguments = arguments,
                    UseShellExecute = false,
                    RedirectStandardOutput = true,
                    RedirectStandardError = true,
                    CreateNoWindow = true,
                }
            };

            process.StartInfo.EnvironmentVariables["PGPASSWORD"] = password;

            process.Start();
            string output = await process.StandardOutput.ReadToEndAsync();
            string error = await process.StandardError.ReadToEndAsync();
            process.WaitForExit();

            if (process.ExitCode == 0)
                Console.WriteLine($"✅ Backup thành công: {backupFile}");
            else
                Console.WriteLine($"❌ Backup lỗi: {error}");
        }
    }
}
