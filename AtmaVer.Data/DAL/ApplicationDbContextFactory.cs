using AtmaVer.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.EntityFrameworkCore.Diagnostics;

namespace AtmaVer.Data.DAL
{
    public class ApplicationDbContextFactory : IDesignTimeDbContextFactory<ApplicationDbContext>
    {
        public ApplicationDbContext CreateDbContext(string[] args)
        {
            var optionsBuilder = new DbContextOptionsBuilder<ApplicationDbContext>();
            optionsBuilder.UseSqlServer("Server=atmaver.mssql.somee.com;Database=atmaver;User Id=atmaver_SQLLogin_1;Password=ok3iu4rd1a;MultipleActiveResultSets=true");
            return new ApplicationDbContext(optionsBuilder.Options);
        }
        
    }
}