using FurnitureStoreBE.Services.BackService;
using Microsoft.AspNetCore.Mvc;

namespace FurnitureStoreBE.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class DatabaseController : ControllerBase
    {
        private readonly IBackupService _backupService;

        public DatabaseController(IBackupService backupService)
        {
            _backupService = backupService;
        }

        [HttpPost("backup")]
        public async Task<IActionResult> BackupDatabase()
        {
            try
            {
                await _backupService.BackupDatabaseAsync();
                return Ok("✅ Backup database thành công.");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"❌ Backup thất bại: {ex.Message}");
            }
        }
    }
}
