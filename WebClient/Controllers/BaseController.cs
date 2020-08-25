using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebClient.Controllers
{
    public class BaseController : Controller
    {
        protected readonly IHttpContextAccessor ctx;

        public BaseController(IHttpContextAccessor ctx)
        {
            this.ctx = ctx;
        }

    }
}
