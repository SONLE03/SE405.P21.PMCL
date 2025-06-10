using FurnitureStoreBE.Constants;
using FurnitureStoreBE.DTOs.Request.AnalysisRequest;
using FurnitureStoreBE.Services.AnalyticsService;
using FurnitureStoreBE.Utils;
using Microsoft.AspNetCore.Mvc;
using System.Net;

namespace FurnitureStoreBE.Controllers.AnalyticsController
{
    [ApiController]
    [Route(Routes.ANALYSIS)]
    public class AnalysisController : ControllerBase
    {
        private readonly IAnalysisService _analysisService;
        public AnalysisController(IAnalysisService analysisService)
        {
            _analysisService = analysisService;
        }
        [HttpGet("summary")]
        public async Task<IActionResult> OrderAnalyticDataSummary()
        {
            return new SuccessfulResponse<object>(await _analysisService.Summary(), (int)HttpStatusCode.OK, "Get data successfully").GetResponse();
        }
        [HttpPost("order-analytics")]
        public async Task<IActionResult> OrderAnalyticDataByMonth([FromBody] AnalysisRequest request)
        {
            return new SuccessfulResponse<object>(await _analysisService.OrderAnalyticData(request.startDate, request.endDate), (int)HttpStatusCode.OK, "Get data successfully").GetResponse();
        }
    }
}
