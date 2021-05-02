using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace MobileStore.Models.Entity
{
    public partial class QL_Hang : DbContext
    {
        public QL_Hang()
            : base("name=Model11")
        {
        }

        public virtual DbSet<Blog> Blogs { get; set; }
        public virtual DbSet<Cart> Carts { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Comment> Comments { get; set; }
        public virtual DbSet<CountryType> CountryTypes { get; set; }
        public virtual DbSet<Image> Images { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<PaymentType> PaymentTypes { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Blog>()
                .Property(e => e.Time)
                .IsFixedLength();

            modelBuilder.Entity<Blog>()
                .Property(e => e.ImageBlog)
                .IsFixedLength();

            modelBuilder.Entity<Blog>()
                .Property(e => e.Summary)
                .IsFixedLength();

            modelBuilder.Entity<Cart>()
                .Property(e => e.total)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Image>()
                .Property(e => e.image1)
                .IsUnicode(false);

            modelBuilder.Entity<Order>()
                .Property(e => e.phone)
                .IsFixedLength();

            modelBuilder.Entity<Order>()
                .Property(e => e.email)
                .IsFixedLength();

            modelBuilder.Entity<Product>()
                .Property(e => e.productPrice)
                .IsFixedLength();

            modelBuilder.Entity<Product>()
                .Property(e => e.productSale)
                .IsFixedLength();

            modelBuilder.Entity<Product>()
                .Property(e => e.productImage)
                .IsFixedLength();

            modelBuilder.Entity<User>()
                .Property(e => e.Password)
                .IsFixedLength();

            modelBuilder.Entity<User>()
                .Property(e => e.Email)
                .IsFixedLength();
        }
    }
}
