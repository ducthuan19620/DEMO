using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MobileStore.Models.Entity;

namespace MobileStore.Models.Entity
{
    public class orderViewProduct
    {
        public Order order { get; set; }
        public Cart cart { get; set; }
        
        public Product product { get; set; }
    }
}