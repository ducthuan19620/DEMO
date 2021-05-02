namespace MobileStore.Models.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Comment")]
    public partial class Comment
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int CommentID { get; set; }

        [StringLength(30)]
        public string NameUser { get; set; }

        [StringLength(50)]
        public string Job { get; set; }

        [StringLength(2000)]
        public string CommentContent { get; set; }
    }
}
