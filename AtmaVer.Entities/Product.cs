using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace AtmaVer.Entities
{
    public class Product : BaseEntity
    {
        public string ProductName { get; set; }
        public string Description { get; set; }
        public string Condition { get; set; }
        public virtual Category Category { get; set; }        
        public virtual ICollection<ProductImage> ProductPhotos { get; set; } = new HashSet<ProductImage>();
        [ForeignKey("Advertisement")]
        public int AdvertisementId { get; set; }
        public virtual Advertisement Advertisement { get; set; } 
    }
}