using System.ComponentModel.DataAnnotations.Schema;

namespace AtmaVer.Entities
{
    public class Category : BaseEntity
    {
        public string CategoryName { get; set; }   
        [ForeignKey("Advertisement")]
        public int AdvertisementId { get; set; }
        public virtual Advertisement Advertisement { get; set; }   
    }
}