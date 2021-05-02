namespace MobileStore.Models.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Order
    {
        [Key]
        public int cartID { get; set; }

        public DateTime? createdDate { get; set; }

        [StringLength(50)]
        public string name { get; set; }

        [StringLength(15)]
        public string phone { get; set; }

        [StringLength(30)]
        public string email { get; set; }

        [StringLength(255)]
        public string address { get; set; }

        [StringLength(20)]
        public string city { get; set; }

        [StringLength(20)]
        public string state { get; set; }

        [StringLength(50)]
        public string paymentMethod { get; set; }
    }
}
