using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MobileStore.Models.Entity;
namespace MobileStore.Models.DAO
{
    public class CartDAO
    {
        QL_Hang db;
        public CartDAO()
        {
            db = new QL_Hang();
        }

        public List<Cart> SelectAll()
        {
            return db.Carts.ToList();
        }

        public Cart GetById(int id)
        {
            return db.Carts.Where(i => i.productID == id).First();
        }

        public bool Delete(int id)
        {
            try
            {
                db.Carts.Remove(db.Carts.Find(id));
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool Insert(Cart cart)
        {
            try
            {
                db.Carts.Add(cart);
                db.SaveChanges();
                return true;

            }catch
            {
                return false;
            }
        
        }

       


    }
}