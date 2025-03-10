
using System.Web.Http;
using static WebApplication1.IAuthService;
using System.Web.Mvc;
using HttpPostAttribute = System.Web.Http.HttpPostAttribute;

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

        [HttpPost]
        [System.Web.Http.Route("login")]
        public IHttpActionResult Login([FromBody] LoginRequest request)
        {
            if (request == null || string.IsNullOrEmpty(request.Username) || string.IsNullOrEmpty(request.Password))
                return BadRequest("Invalid request data.");

            var userResponse = _authService.Authenticate(request.Username, request.Password);
            if (userResponse == null)
                return Unauthorized();

            return Ok(userResponse);
        }

        [HttpPost]
        [System.Web.Http.Route("login-2fa")]
        public IHttpActionResult LoginWith2FA([FromBody] Login2FARequest request)
        {
            if (request == null || string.IsNullOrEmpty(request.Username) || string.IsNullOrEmpty(request.Token))
                return BadRequest("Invalid request data.");

            var userResponse = _authService.AuthenticateWith2FA(request.Username, request.Token);
            if (userResponse == null)
                return Unauthorized();

            return Ok(userResponse);
        }
    }
}
