using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MobileStore.Models.Entity;

namespace MobileStore.Models.DAO
{
    public class BlogDAO
    {
        QL_Hang db;
        public BlogDAO()
        {
            db = new QL_Hang();
        }

        public List<Blog> SelectAll()
        {
            return db.Blogs.ToList();
        }

        public Blog GetById(int id)
        {
            return db.Blogs.Where(i => i.BlogID == id).First();
        }
    }
}