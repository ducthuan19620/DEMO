namespace MobileStore.Models.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        public int productID { get; set; }

        [Required]
        [StringLength(50)]
        public string productName { get; set; }

        [StringLength(20)]
        public string productPrice { get; set; }

        [StringLength(20)]
        public string productSale { get; set; }

        [StringLength(2000)]
        public string productInfor { get; set; }

        [StringLength(30)]
        public string productImage { get; set; }

        [StringLength(4000)]
        public string productIntroduce { get; set; }

        public int? TypeID { get; set; }

        public bool? Status { get; set; }
    }
}
