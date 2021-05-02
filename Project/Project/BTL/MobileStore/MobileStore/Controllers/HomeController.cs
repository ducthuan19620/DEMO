using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MobileStore.Models;
using MobileStore.Models.DAO;
using MobileStore.Models.Entity;
using PagedList;

namespace MobileStore.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ProductDAO productDAO = new ProductDAO();
            return View(productDAO.SelectAllNewProduct());
        }

        [ChildActionOnly]
        public ActionResult GetAllComment()
        {
            TestimonialsDAO testimonialsDAO = new TestimonialsDAO();
            return PartialView("_GetAllComment", testimonialsDAO.GetAllTestimonials());
        }
    }
}