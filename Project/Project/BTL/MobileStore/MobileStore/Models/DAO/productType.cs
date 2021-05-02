using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MobileStore.Models.Entity;

namespace MobileStore.Models.DAO
{
    public class productType
    {
        public Product product { get; set; }
        public Category category { get; set; }
    }
}