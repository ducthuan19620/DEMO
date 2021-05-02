using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace MobileStore.Controllers
{
    public class CommonController : ApiController
    {
        public bool AddCart(int id, int colorId)
        { 
            try
            {
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
