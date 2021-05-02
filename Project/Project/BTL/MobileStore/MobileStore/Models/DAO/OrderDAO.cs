using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MobileStore.Models.Entity;
using MobileStore.Models.DAO;

namespace MobileStore.Models.DAO
{
    public class OrderDAO
    {
        QL_Hang db = null;
        public OrderDAO()
        {
            db = new QL_Hang();
        }

        public List<Order> SelectAll()
        {
            return db.Orders.ToList();
        }


        public Order GetOrderById(int cartID)
        {

            return db.Orders.Where(x => x.cartID == cartID).First() ;
        }

        public int Insert(Order order)
        {
            db.Orders.Add(order);
            db.SaveChanges();
            return order.cartID;

        }

        public bool Delete(int id)
        {
            try
            {
                db.Orders.Remove(db.Orders.Find(id));
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

    }
}