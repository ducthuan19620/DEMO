using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MobileStore.Models.DAO;
using MobileStore.Models.Entity;

namespace MobileStore.Controllers
{
    public class CartController : Controller
    {
        // GET: Cart
        public ActionResult Index()
        {
            if (Session["cart"] == null)
            {
                ViewBag.GioHangCount = 0;
            }
            else
            {
                List<Cart> cart = (List<Cart>)Session["cart"];
                ViewBag.GioHangCount = cart.Count;
            }
            return PartialView("_Index");
        }

        [HttpPost]
        public ActionResult Buy(int id)
        {
            ProductDAO productDAO = new ProductDAO();
            ImageDAO imageDAO = new ImageDAO();
            if (Session["cart"] == null)
            {
                List<Cart> cart = new List<Cart>();
                cart.Add(new Cart { product = productDAO.GetById(id), quantity = 1 });
                Session["cart"] = cart;
            }
            else
            {
                List<Cart> cart = (List<Cart>)Session["cart"];
                int index = isExist(id);
                if (index != -1)
                {
                    cart[index].quantity++;
                }
                else
                {
                    cart.Add(new Cart { product = productDAO.GetById(id), quantity = 1 });
                }
                Session["cart"] = cart;

            }
            return RedirectToAction("Index");
        }

        public ActionResult Remove(int id)
        {
            List<Cart> cart = (List<Cart>)Session["cart"];
            int index = isExist(id);
            cart.RemoveAt(index);
            Session["cart"] = cart;
            return RedirectToAction("Index");
        }

        private int isExist(int id)
        {
            List<Cart> cart = (List<Cart>)Session["cart"];
            for (int i = 0; i < cart.Count; i++)
                if (cart[i].product.productID.Equals(id))
                    return i;
            return -1;
        }

        public ActionResult RemoveCart()
        {
            List<Cart> cart = (List<Cart>)Session["cart"];
            cart = null;
            Session["cart"] = cart;
            return RedirectToAction("Index");
        }


        public ActionResult UpdateCart(FormCollection frc)
        {
            string[] quantities = frc.GetValues("quantity");
            List<Cart> lstCart = (List<Cart>)Session["cart"];
            for (int i = 0; i < lstCart.Count; i++)
            {
                lstCart[i].quantity = Convert.ToInt32(quantities[i]);
            }
            Session["cart"] = lstCart;
            return View("_Index");
        }


        public ActionResult GetNumBer()
        {
            var cart = Session["cart"];
            var list = new List<Cart>();
            if (cart != null)
            {
                list = (List<Cart>)cart; ;
            }
            return PartialView("GetNumBer");
        }

        public ActionResult Payment()
        {
            var cart = Session["cart"];
            var list = new List<Cart>();
            if (cart != null)
            {
                list = (List<Cart>)cart; ;
            }
            return View(list);
        }

        [HttpPost]
        public ActionResult Payment(string name, string phone, string email, string address, string city, string state, string paymentMethod)
        {

            var order = new Order();
            order.createdDate = DateTime.Now;
            order.name = name;
            order.phone = phone;
            order.email = email;
            order.address = address;
            order.city = city;
            order.state = state;
            order.paymentMethod = paymentMethod;

            try
            {
                var id = new OrderDAO().Insert(order);
                var lstCart = (List<Cart>)Session["cart"];
                var detailDao = new CartDAO();

                foreach (var item in lstCart)
                {
                    var cart = new Cart();
                    cart.productID = item.product.productID;
                    cart.cartID = id;
                    cart.quantity = item.quantity;
                    cart.total = item.quantity * decimal.Parse(item.product.productSale);
                    detailDao.Insert(cart);

                }
            } catch
            {
                return Redirect("Error");
            }

            OrderDAO orderDAO = new OrderDAO();
            return View(orderDAO.GetOrderById(order.cartID));
        }


        public ActionResult Error()
        {
            return View();
        }


        public ActionResult RemovePayment(int cartID)
        {
            OrderDAO orderDAO = new OrderDAO();
            CartDAO cartDAO = new CartDAO();
            cartDAO.Delete(cartID);
            orderDAO.Delete(cartID);
            return View();
           

        }
    }
}