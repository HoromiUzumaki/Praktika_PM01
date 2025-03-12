
using System.Web.Http;
using static WebApplication1.IAuthService;
using System.Web.Mvc;
using HttpPostAttribute = System.Web.Http.HttpPostAttribute;
using System;

namespace WebApplication1.Controllers
{
    [System.Web.Http.RoutePrefix("api/auth")]
    public class AuthController : ApiController
    {
        private readonly IAuthService _authService;

        public AuthController(IAuthService authService)
        {
            _authService = authService;
        }

        // Обычный вход
        [HttpPost]
        [System.Web.Http.Route("login")]
        public IHttpActionResult Login([FromBody] LoginRequest request)
        {
            if (request == null || string.IsNullOrEmpty(request.Email) || string.IsNullOrEmpty(request.Password))
                return BadRequest("Invalid request data.");

            var userResponse = _authService.Authenticate(request.Email, request.Password);
            if (userResponse == null)
                return Unauthorized();

            return Ok(userResponse);
        }

        // Запрос на генерацию токена для 2FA
        [HttpPost]
        [System.Web.Http.Route("request-2fa")]
        public IHttpActionResult RequestTwoFactorToken([FromBody] LoginRequest request)
        {
            if (request == null || string.IsNullOrEmpty(request.Email))
                return BadRequest("Invalid request data.");

            try
            {
                _authService.GenerateAndSaveTwoFactorToken(request.Email);
                return Ok(new { Message = "2FA token generated." });
            }
            catch (Exception ex)
            {
                return InternalServerError(ex);
            }
        }

        // Вход с 2FA
        [HttpPost]
        [System.Web.Http.Route("login-2fa")]
        public IHttpActionResult LoginWith2FA([FromBody] Login2FARequest request)
        {
            if (request == null || string.IsNullOrEmpty(request.Email) || string.IsNullOrEmpty(request.Token))
                return BadRequest("Invalid request data.");

            var userResponse = _authService.AuthenticateWith2FA(request.Email, request.Token);
            if (userResponse == null)
                return Unauthorized();

            return Ok(userResponse);
        }
    }
}
