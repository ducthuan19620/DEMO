using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MobileStore.Models.Entity;
using PagedList;
using MobileStore.Models.DAO;

namespace MobileStore.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Products(int? page)
        {
            QL_Hang db = new QL_Hang();
            // 1. Tham số int? dùng để thể hiện null và kiểu int
            // page có thể có giá trị là null và kiểu int.

            // 2. Nếu page = null thì đặt lại là 1.
            if (page == null) page = 1;

            // 3. Tạo truy vấn, lưu ý phải sắp xếp theo trường nào đó, ví dụ OrderBy
            // theo LinkID mới có thể phân trang.
            var links = (from l in db.Products
                         select l).OrderBy(x => x.productID);

            // 4. Tạo kích thước trang (pageSize) hay là số Link hiển thị trên 1 trang
            int pageSize = 3;

            // 4.1 Toán tử ?? trong C# mô tả nếu page khác null thì lấy giá trị page, còn
            // nếu page = null thì lấy giá trị 1 cho biến pageNumber.
            int pageNumber = (page ?? 1);

            // 5. Trả về các Link được phân trang theo kích thước và số trang.
            return View(links.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult GetAllProduct()
        {
            ProductDAO productDAO = new ProductDAO();
            ViewBag.products = productDAO.SelectAll();
            return View();
        }

        public ActionResult LoadAllProduct()
        {
            ProductDAO productDAO = new ProductDAO();
            return View(productDAO.SelectAll());
        }

        public ActionResult GetProductDetails(int id)
        {
            ProductDAO productDAO = new ProductDAO();
            return PartialView(productDAO.GetByTypeId(id));
        }

        public ActionResult ProductDetail(int id)
        {
            QL_Hang db = new QL_Hang();
            List<Product> products = db.Products.ToList();
            List<Image> images = db.Images.ToList();

            var result = from p in products
                         join i in images on p.productID equals i.productID
                         where p.productID == id
                         select new productViewModel { product = p, image = i };

            return View(result);
        }

        [ChildActionOnly]
        public ActionResult ProductInfor(int id)
        {
            ProductDAO productDAO = new ProductDAO();
            return PartialView("_ProductInfor", productDAO.GetById(id));
        }

        [ChildActionOnly]
        public ActionResult ProductByID(int id)
        {
            ProductDAO productDAO = new ProductDAO();
            return PartialView("_ProductByID", productDAO.GetById(id));
        }

       
        [ChildActionOnly]
        public ActionResult ProductIntro(int id)
        {
            ProductDAO productDAO = new ProductDAO();
            return PartialView("_ProductIntro", productDAO.GetById(id));
        }

        [ChildActionOnly]
        public ActionResult GetProductById(int id)
        {
            ProductDAO productDAO = new ProductDAO();
            return PartialView("_GetProductByID",productDAO.GetById(id));
        }
    }
}