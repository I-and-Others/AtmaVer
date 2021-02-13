using System.ComponentModel.DataAnnotations.Schema;

namespace AtmaVer.Entities
{
    public class ProductImage : BaseEntity
    {
        public string PhotoUrl { get; set; }
        [ForeignKey("Product")]
        public int ProductId { get; set; }
        public virtual Product Product { get; set; }      
    }
}