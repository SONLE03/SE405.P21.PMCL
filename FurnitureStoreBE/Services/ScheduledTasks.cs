using FurnitureStoreBE.Services.BackService;

namespace FurnitureStoreBE.Services
{
    public class ScheduledTasks
    {
        private readonly IBackupService _backupService;

        public ScheduledTasks(IBackupService backupService)
        {
            _backupService = backupService;
        }

        public async Task BackupPostgresDatabase()
        {
            await _backupService.BackupDatabaseAsync();
        }
    }
}
