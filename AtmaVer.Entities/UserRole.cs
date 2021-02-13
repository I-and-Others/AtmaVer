using System.ComponentModel.DataAnnotations.Schema;

namespace AtmaVer.Entities
{
    public class UserRole : BaseEntity
    {
        [ForeignKey("User")]
        public int UserId { get; set; }
        public virtual User User { get; set; }
        [ForeignKey("Role")]
        public int RoleId { get; set; }
        public virtual Role Role { get; set; }
    }
}