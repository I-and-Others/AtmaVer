using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace AtmaVer.Entities
{
    public class Advertisement : BaseEntity
    {
        public bool IsDemand { get; set; }
        public bool IsExchange { get; set; }
        public virtual Product Product { get; set; }        
        [ForeignKey("User")]
        public int UserId { get; set; }
        public virtual User User { get; set; }   
        public virtual ICollection<ChatRoom> ChatRooms { get; set; } = new HashSet<ChatRoom>();
    }
}