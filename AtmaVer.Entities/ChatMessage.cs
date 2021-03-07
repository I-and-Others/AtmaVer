using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AtmaVer.Entities
{
    public class ChatMessage
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string Message { get; set; }
        public DateTime SendTime { get; set; }
        [ForeignKey("ChatRoom")]
        public int ChatRoomId { get; set; }
        public virtual ChatRoom ChatRoom { get; set; } 
        [ForeignKey("User")]
        public int UserId { get; set; }
        public virtual User User { get; set; } 
    }
}