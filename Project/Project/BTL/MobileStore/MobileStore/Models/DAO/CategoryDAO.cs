using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MobileStore.Models.Entity;
namespace MobileStore.Models.DAO
{
    public class CategoryDAO
    {
        QL_Hang db;
        public CategoryDAO()
        {
            db = new QL_Hang();
        }

        public List<Category> SelectAll()
        {
            return db.Categories.ToList();
        }

        public Category GetById(int id)
        {
            return db.Categories.Where(i => i.TypeID == id).First();
        }

        public void Create(Category category)
        {
            db.Categories.Add(category);
            db.SaveChanges();
        }

        public bool Delete(int id)
        {
            try
            {
                db.Categories.Remove(db.Categories.Find(id));
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        internal object Add(Category c)
        {
            throw new NotImplementedException();
        }
    }
}