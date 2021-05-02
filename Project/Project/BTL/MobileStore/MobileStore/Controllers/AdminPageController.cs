using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MobileStore.Models.Entity;
using MobileStore.Models.DAO;
using MobileStore.Content.Admin.Common;
using System.Security.Cryptography;
using System.Text;

namespace MobileStore.Controllers
{
    public class AdminPageController : Controller
    {
        // GET: AdminPage
        public ActionResult Index()
        {
            if(Session["USER_SESSION"] != null)
            {
                ProductDAO product = new ProductDAO();
                return View(product.SelectAll());
            }
            else
            {
                return RedirectToAction("Login");
            }
        }

        public ActionResult Login(User user)
        {
            if (ModelState.IsValid)
            {
                QL_Hang db = new QL_Hang();
                var dao = new UserDAO();
                var result = dao.Login(user.Username, MD5Hash(user.Password));
                if (result == 1)
                {
                    //add session
                    //var name = dao.GetByName(user.Username);
                    var userSession = new User();
                    userSession.Username = user.Username;
                    userSession.UserID = user.UserID;
                    Session.Add(UserLogin.USER_SESSION, userSession);
                    Session["USER_SESSION"] = userSession.Username;
                    return RedirectToAction("Index", "AdminPage");
                }
                else if(result == 0)
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại");
                }else if(result == -1)
                {
                    ModelState.AddModelError("", "Tài khoản đang bị khóa");
                }else
                {
                    ModelState.AddModelError("", "Đăng nhập thất bại");
                }
            }
            return View();

        }


        public static string MD5Hash(string input)
        {
            if (string.IsNullOrEmpty(input)) return null;
            StringBuilder hash = new StringBuilder();
            MD5CryptoServiceProvider md5provider = new MD5CryptoServiceProvider();
            byte[] bytes = md5provider.ComputeHash(new UTF8Encoding().GetBytes(input));

            for (int i = 0; i < bytes.Length; i++)
            {
                hash.Append(bytes[i].ToString("x2"));
            }
            return hash.ToString();
        }


        public ActionResult Register(User user)
        {
            QL_Hang db = new QL_Hang();
            if (ModelState.IsValid)
            {
                var check = db.Users.FirstOrDefault(s => s.Email == user.Email);
                if (check == null)
                {
                    user.Password = MD5Hash(user.Password);
                    db.Configuration.ValidateOnSaveEnabled = false;
                    db.Users.Add(user);
                    db.SaveChanges();
                    return RedirectToAction("Index", "AdminPage");
                }
                else
                {
                    ViewBag.error = "Email already exists";
                    return View();
                }


            }
            return View();
        }

        public ActionResult Logout()
        {
            Session.Clear();//remove session
            return RedirectToAction("Login", "AdminPage");
        }

        public ActionResult GetByUser(string username)
        {
            UserDAO userDAO = new UserDAO();
            return PartialView("_GetByUser", userDAO.GetByName(username));
        }

        //Get Product
        public ActionResult GetAllProduct()
        {
            ProductDAO product = new ProductDAO();
            return View(product.SelectAll());
        }

        public ActionResult CreateProduct()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CreateProduct(Product product)
        {
            ProductDAO productDAO = new ProductDAO();
            productDAO.Add(product);
            return View();
        }

        public ActionResult GetType(int id)
        {
            QL_Hang db = new QL_Hang();
            List<Product> products = db.Products.ToList();
            List<Category> categories = db.Categories.ToList();

            var result = from p in products
                         join t in categories on p.TypeID equals t.TypeID
                         where p.TypeID == id
                         select new productType { product = p, category = t };

            return View(result);
        }

        public ActionResult CreateNewProduct()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateNewProduct([Bind(Include = "productID, productName, productPrice, productSale, productInfor, productIntroduce, TypeID, Status")]Product product, HttpPostedFileBase image)
        {
            QL_Hang db = new QL_Hang();
            if(image != null && image.ContentLength > 0)
            {
                product.productImage = image.ContentLength.ToString();
                byte[] data = Encoding.Unicode.GetBytes(product.productImage);
                string fileName = System.IO.Path.GetFileName(image.FileName);
                string urlImage = Server.MapPath("~/Content/Images/" + fileName);
                image.SaveAs(urlImage);
                product.productImage = fileName;

            }

            if (ModelState.IsValid)
            {
                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(product);
        }

        

        public ActionResult UpdateProduct(int id)
        {
            ProductDAO productDAO = new ProductDAO();
            return View(productDAO.GetById(id));
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UpdateProduct([Bind(Include = "productID, productName, productPrice, productSale, productInfor, productIntroduce, TypeID, Status")] Product product, HttpPostedFileBase image)
        {
            QL_Hang db = new QL_Hang();
            if (image != null && image.ContentLength > 0)
            {
                product.productImage = image.ContentLength.ToString();
                byte[] data = Encoding.Unicode.GetBytes(product.productImage);
                string fileName = System.IO.Path.GetFileName(image.FileName);
                string urlImage = Server.MapPath("~/Content/Images/" + fileName);
                image.SaveAs(urlImage);
                product.productImage = fileName;

            }

            if (ModelState.IsValid)
            {
                ProductDAO productDAO = new ProductDAO();
                productDAO.Update(product);
                return RedirectToAction("Index");
            }
            return View(product);
        }


     
        public ActionResult Delete(int id)
        {
            ProductDAO productDAO = new ProductDAO();
            productDAO.Delete(id);
            return RedirectToAction("Index");
        }

        [HttpDelete]

        public ActionResult Delete(int? id)
        {
            ProductDAO productDAO = new ProductDAO();
            productDAO.Delete(id);
            return RedirectToAction("Index");
        }

        public ActionResult GetTypeID()
        {
            CategoryDAO categoryDAO = new CategoryDAO();
            return PartialView("_GetTypeID", categoryDAO.SelectAll());
        }

        public ActionResult GetAllCategory()
        {
            CategoryDAO categoryDAO = new CategoryDAO();
            return PartialView("_GetAllCategory", categoryDAO.SelectAll());
        }

        public ActionResult CreateCategory()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CreateCategory(Category c)
        {
            CategoryDAO categoryDAO = new CategoryDAO();
            categoryDAO.Create(c);
            return RedirectToAction("GetAllCategory");
        }

        public ActionResult UpdateCategoryById(int id)
        {
            CategoryDAO categoryDAO = new CategoryDAO();
            return PartialView("_UpdateCategoryById", categoryDAO.GetById(id));

        }

        [HttpDelete]
        public ActionResult DeleteCategoryById(int id)
        {
            CategoryDAO categoryDAO = new CategoryDAO();
            categoryDAO.Delete(id);
            return RedirectToAction("Index");
        }

        public ActionResult GetAllOrder()
        {
            QL_Hang db = new QL_Hang();
            List<Order> orders = db.Orders.ToList();
            List<Cart> carts = db.Carts.ToList();
            List<Product> products = db.Products.ToList();

            var result = from o in orders
                         join c in carts on o.cartID equals c.cartID
                         join p in products on c.productID equals p.productID
                         select new orderViewProduct { order = o, cart = c, product = p };

            return PartialView("_GetAllOrder", result);
        }
    }
}