using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MobileStore.Models.Entity;

namespace MobileStore.Models.DAO
{
    public class TestimonialsDAO
    {
        QL_Hang db;
        public TestimonialsDAO()
        {
            db = new QL_Hang();
        }

        public List<Comment> GetAllTestimonials()
        {
            return db.Comments.ToList();
        }
    }
}