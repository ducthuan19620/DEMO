using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MobileStore.Models.Entity;
using MobileStore.Models.DAO;

namespace MobileStore.Controllers
{
    public class BlogController : Controller
    {
        // GET: Default
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Blog()
        {
            BlogDAO blogDAO = new BlogDAO();
            return View(blogDAO.SelectAll());
        }

        public ActionResult BlogDetail(int id)
        {
            BlogDAO blogDAO = new BlogDAO();
            return View(blogDAO.GetById(id));
        }
    }
}