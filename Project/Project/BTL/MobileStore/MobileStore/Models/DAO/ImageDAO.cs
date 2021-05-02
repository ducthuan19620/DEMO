using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MobileStore.Models.Entity;

namespace MobileStore.Models.DAO
{
    public class ImageDAO
    {
        QL_Hang db;
        public ImageDAO()
        {
            db = new QL_Hang();

        }

        public List<Image> SelectAll()
        {
            return db.Images.ToList();
        }

        public Image GetById(int id, int colorID)
        {
            return db.Images.Where(x => x.productID == id).Where(x => x.colorID == colorID).First();
        }

      
    }
}