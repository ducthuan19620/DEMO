using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MobileStore.Models.Entity;

namespace MobileStore.Models.DAO
{
    public class UserDAO
    {
        QL_Hang db = new QL_Hang();
        public UserDAO()
        {
            db = new QL_Hang();
        }

        public List<User> SelectAll()
        {
            return db.Users.ToList(); 
        }
        public int Login(string u, string p)
        {
            if (db.Users.Where(a => a.Username == u && a.Password == p).Count() > 0)
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }

        public User GetByName(string username)
        {
            return db.Users.SingleOrDefault(x => x.Username == username);
        }
    }
}