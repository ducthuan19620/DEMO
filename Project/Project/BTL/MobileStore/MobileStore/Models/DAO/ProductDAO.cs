using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MobileStore.Models.Entity;

namespace MobileStore.Models.DAO
{
    public class ProductDAO
    {
        QL_Hang db;
        public ProductDAO()
        {
            db = new QL_Hang();
        }

        public List<Product> SelectAllNewProduct()
        {
            int numberOfrecords = 9; // read from user
            QL_Hang db = new QL_Hang();
            List<Product> products = db.Products.ToList();
            List<Image> images = db.Images.ToList();
            var list = (from t in products
                        where t.Status == true 
                        orderby t.productID
                        select t).Take(numberOfrecords);
            return list.ToList();
        }

        public List<Product> SelectAll()
        {
            return db.Products.ToList();
        }

        public List<Product> GetByTypeId(int id)
        {
            return db.Products.Where(x => x.TypeID == id).ToList();
        }

        public List<Product> ListByTypeId(int typeId, ref int totalRecord,int pageIndex = 1, int pageSize = 2)
        {
            totalRecord = db.Products.Where(x => x.TypeID == typeId).Count();
            var model = db.Products.Where(x => x.TypeID == typeId).OrderByDescending(x=>x.TypeID).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
            return model;
        }

        public Product GetById(int id)
        {
            return db.Products.Where(i => i.productID == id).First();
        }

        public void Add(Product product)
        {
            db.Products.Add(product);
            db.SaveChanges();
        }

        public void Update(Product product)
        {
            db.Entry(product).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }

        public bool Delete(int? id)
        {
            try
            {
                db.Products.Remove(db.Products.Find(id));
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