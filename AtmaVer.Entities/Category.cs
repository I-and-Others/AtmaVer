using System.ComponentModel.DataAnnotations.Schema;

namespace AtmaVer.Entities
{
    public class Category : BaseEntity
    {
        public string CategoryName { get; set; }   
        [ForeignKey("Product")]
        public int ProductId { get; set; }
        public virtual Product Product { get; set; }   
    }
}