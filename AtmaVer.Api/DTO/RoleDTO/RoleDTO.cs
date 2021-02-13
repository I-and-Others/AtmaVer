using System;

namespace AtmaVer.Api.DTO.RoleDTO
{
    public class RoleDTO
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public bool IsActive { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime RecordedAtDate { get; set; }
        public DateTime UpdatedAtDate { get; set; }
        public string SlugUrl { get; set; }
        public int UrlId { get; set; }
    }
}