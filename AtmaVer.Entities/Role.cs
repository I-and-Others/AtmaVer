using System.Collections.Generic;
using System.Collections.ObjectModel;

namespace AtmaVer.Entities
{
    public class Role : BaseEntity
    {
        public Role()
        {
            UserRoles = new Collection<UserRole>();
        }

        public string Name { get; set; }
        public virtual ICollection<UserRole> UserRoles { get; set; } = new HashSet<UserRole>();
    }
}