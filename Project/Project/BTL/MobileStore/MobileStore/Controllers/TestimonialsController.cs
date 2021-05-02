using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MobileStore.Models.DAO;

namespace MobileStore.Controllers
{
    public class TestimonialsController : Controller
    {
        // GET: Testimonials
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Testimonials()
        {
            TestimonialsDAO testimonialsDAO = new TestimonialsDAO();
            return View(testimonialsDAO.GetAllTestimonials());
        }
        [ChildActionOnly]
        public ActionResult GetAllComment()
        {
            TestimonialsDAO testimonialsDAO = new TestimonialsDAO();
            return PartialView("_GetAllComment", testimonialsDAO.GetAllTestimonials());
        }
    }
}