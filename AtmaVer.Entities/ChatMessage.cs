using System.ComponentModel.DataAnnotations.Schema;

namespace AtmaVer.Entities
{
    public class ChatMessage : BaseEntity
    {
        public string Message { get; set; }
        [ForeignKey("ChatRoom")]
        public int ChatRoomId { get; set; }
        public virtual ChatRoom ChatRoom { get; set; } 
        [ForeignKey("User")]
        public int UserId { get; set; }
        public virtual User User { get; set; } 
    }
}