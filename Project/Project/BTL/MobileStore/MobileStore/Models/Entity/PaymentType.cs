namespace MobileStore.Models.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PaymentType")]
    public partial class PaymentType
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int paymentTypeID { get; set; }

        [StringLength(50)]
        public string paymentTypeName { get; set; }
    }
}
