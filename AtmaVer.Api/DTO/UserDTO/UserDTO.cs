using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AtmaVer.Api.DTO.UserDTO
{
    public class UserDTO
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string PasswordHash { get; set; }
        public string SecretKey { get; set; } 
        public string Gender { get; set; }
        public DateTime BirthDate { get; set; }

    }
}