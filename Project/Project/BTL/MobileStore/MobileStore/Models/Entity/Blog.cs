namespace MobileStore.Models.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Blog")]
    public partial class Blog
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int BlogID { get; set; }

        [StringLength(4000)]
        public string TitleBlog { get; set; }

        [StringLength(30)]
        public string Time { get; set; }

        [StringLength(4000)]
        public string ContentBlog { get; set; }

        [StringLength(30)]
        public string ImageBlog { get; set; }

        [StringLength(50)]
        public string NameUser { get; set; }

        [StringLength(2000)]
        public string Summary { get; set; }
    }
}
