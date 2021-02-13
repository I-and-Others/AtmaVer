using Microsoft.EntityFrameworkCore;
using AtmaVer.Services.Helpers;
using AtmaVer.Entities;
using System;

namespace AtmaVer.Data.DAL
{
    public static class ModelBuilderExtensions
    {
        public static void Seed(this ModelBuilder modelBuilder)
        {
            #region Cretion of User
            var admin = new User()
            {
                Id = 1,
                FirstName = "Admin",
                LastName = "Admin",
                UserName = "mvollstagg",
                Email = "admin@admin.com",
                PhoneNumber = "0534 895 22 84",
                Gender = "Male",
                BirthDate = DateTime.Now,
                IsActive = true
            };
            admin.PasswordHash = HashHelper.CreatePasswordHash("Admin123", admin.SecretKey);
            modelBuilder.Entity<User>().HasData(admin);
            #endregion

            #region Creation of Admin & User roles
            Role adminRole = new Role
            {
                Id = 1,
                Name = "admin",
                SlugUrl = "admin",
                UrlId = 1,
                IsActive = true
            };

            Role userRole = new Role
            {
                Id = 2,
                Name = "user",
                SlugUrl = "user",
                UrlId = 2,
                IsActive = true
            };

            modelBuilder.Entity<Role>().HasData(adminRole, userRole);
            #endregion

            #region UserRole Ataması
            UserRole adminUserRole = new UserRole
            {
                Id = 1,
                UserId = admin.Id,
                RoleId = adminRole.Id,
                SlugUrl = "adminrole",
                UrlId = 1,
                IsActive = true
            };

            modelBuilder.Entity<UserRole>().HasData(adminUserRole);
            #endregion
        }
    }
}
