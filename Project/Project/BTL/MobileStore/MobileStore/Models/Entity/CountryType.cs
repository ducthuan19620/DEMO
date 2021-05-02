namespace MobileStore.Models.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CountryType")]
    public partial class CountryType
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int countryID { get; set; }

        [Required]
        [StringLength(50)]
        public string countryName { get; set; }
    }
}
