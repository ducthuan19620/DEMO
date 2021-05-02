using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MobileStore.Models.DAO;
using MobileStore.Models.Entity;

namespace MobileStore.Controllers
{
    public class CheckoutController : Controller
    {
        // GET: Checkout
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Checkout()
        {
            return View();
        }

       

    }
}