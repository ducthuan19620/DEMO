using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MobileStore.Models.DAO;
using MobileStore.Models.Entity;

namespace MobileStore.Controllers
{
    public class AjaxController : Controller
    {
        // GET: Ajax
        
        public ActionResult LoadAllProduct()
        {
            return View();
        }

        public ActionResult LoadTypeProduct()
        {
            CategoryDAO categoryDAO = new CategoryDAO();
            return PartialView(categoryDAO.SelectAll());
        }

        public ActionResult LoadProductByTypeID(int id, int page = 1, int pageSize = 6)
        {
            var product = new ProductDAO().GetByTypeId(id);
            ViewBag.Product = product;
            int totalRecord = 6;
            var model = new ProductDAO().ListByTypeId(id, ref totalRecord, page, pageSize);
            ViewBag.Id = id;
            ViewBag.Total = totalRecord;
            ViewBag.Page = page;

            int maxPage = 5;
            int totalPage = 0;

            totalPage = (int)Math.Ceiling((double)(totalRecord / pageSize));
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = maxPage;
            ViewBag.Next = page + 1;
            ViewBag.Prev = page - 1;

            return View(model);
        }

        public ActionResult GetProductByTypeId(int id)
        {
            ProductDAO productDAO = new ProductDAO();
            return View(productDAO.GetByTypeId(id));
        }


    
    }
}