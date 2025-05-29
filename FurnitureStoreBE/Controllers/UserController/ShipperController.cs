using FurnitureStoreBE.Common.Pagination;
using FurnitureStoreBE.Constants;
using FurnitureStoreBE.DTOs.Request.UserRequest;
using FurnitureStoreBE.Enums;
using FurnitureStoreBE.Services.UserService;
using FurnitureStoreBE.Utils;
using Microsoft.AspNetCore.Mvc;
using System.Net;

namespace FurnitureStoreBE.Controllers.UserController
{
    [ApiController]
    [Route(Routes.SHIPPER)]
    public class ShipperController : ControllerBase
    {
        private readonly IUserService _userService;
        public ShipperController(IUserService userService)
        {
            _userService = userService;
        }
        [HttpGet]
        public async Task<IActionResult> GetShipper([FromQuery] PageInfo pageInfo)
        {
            return new SuccessfulResponse<object>(await _userService.GetAllUsers(ERole.Shipper.ToString(), pageInfo), (int)HttpStatusCode.OK, "Get Shipper successfully").GetResponse();
        }
        [HttpGet("claims/{shipperId}")]
        public async Task<IActionResult> GetShipperClaimsByShipperId(string shipperId)
        {
            return new SuccessfulResponse<object>(await _userService.GetUserClaims(shipperId), (int)HttpStatusCode.Created, "Shipper claims retrieved successfully").GetResponse();
        }

        [HttpGet("claims")]
        public async Task<IActionResult> GetShipperClaims()
        {
            var result = await _userService.GetClaimsByRole(2);
            return new SuccessfulResponse<object>(result, (int)HttpStatusCode.Created, "Claims retrieved successfully").GetResponse();
        }
        [HttpPost()]
        public async Task<IActionResult> CreateShipper([FromBody] UserRequestCreate userRequestCreate)
        {
            return new SuccessfulResponse<object>(await _userService.CreateUser(userRequestCreate, ERole.Shipper.ToString()), (int)HttpStatusCode.Created, "Shipper created successfully").GetResponse();
        }
        [HttpPut("{shipperId}")]
        public async Task<IActionResult> UpdateShipper(string shipperId, [FromBody] UserRequestUpdate userRequestUpdate)
        {
            return new SuccessfulResponse<object>(await _userService.UpdateUser(shipperId, userRequestUpdate), (int)HttpStatusCode.OK, "Shipper modified successfully").GetResponse();
        }
        [HttpPut("ban/{shipperId}")]
        public async Task<IActionResult> BanShipper(string shipperId)
        {
            await _userService.BanUser(shipperId);
            return new SuccessfulResponse<object>(null, (int)HttpStatusCode.OK, "Shipper ban successfully").GetResponse();
        }
        [HttpPut("unban/{shipperId}")]
        public async Task<IActionResult> UnbanShipper(string shipperId)
        {
            await _userService.UnbanUser(shipperId);
            return new SuccessfulResponse<object>(null, (int)HttpStatusCode.OK, "Shipper unban successfully").GetResponse();
        }
        [HttpPut("claims/{shipperId}")]
        public async Task<IActionResult> UpdateShipperClaims(string shipperId, [FromBody] List<UserClaimsRequest> userClaimsRequest)
        {
            await _userService.UpdateUserClaims(shipperId, userClaimsRequest);
            return new SuccessfulResponse<object>(null, (int)HttpStatusCode.OK, "Shipper claims modified successfully").GetResponse();
        }
        [HttpDelete("{shipperId}")]
        public async Task<IActionResult> DeleteShipper(string shipperId)
        {
            await _userService.DeleteUser(shipperId);
            return new SuccessfulResponse<object>(null, (int)HttpStatusCode.OK, "Shipper deleted successfully").GetResponse();

        }
    }
}
