using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AtmaVer.Entities;

namespace AtmaVer.Api.DTO.AdvertisementDTO
{
    public class AdvertisementDTO
    {
        public bool IsDemand { get; set; }
        public bool IsExchange { get; set; }
        public virtual Category Category { get; set; }
        public virtual Product Product { get; set; } 
        public virtual User User { get; set; }   
    }
}