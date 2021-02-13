using System.ComponentModel.DataAnnotations.Schema;

namespace AtmaVer.Entities
{
    public class UserImage : BaseEntity
    {
        public string PhotoUrl { get; set; }
        [ForeignKey("User")]
        public int UserId { get; set; }
        public virtual User User { get; set; }      
    }
}