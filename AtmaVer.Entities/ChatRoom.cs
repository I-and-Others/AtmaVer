using System.Collections.Generic;

namespace AtmaVer.Entities
{
    public class ChatRoom : BaseEntity
    {
        public virtual ICollection<User> Users { get; set; } = new HashSet<User>();
        public virtual ICollection<ChatMessage> ChatMessages { get; set; } = new HashSet<ChatMessage>();
        public int Advertisement1Id { get; set; }
        public int Advertisement2Id { get; set; }
        public virtual ICollection<Advertisement> Advertisements { get; set; } = new HashSet<Advertisement>();
    }
}