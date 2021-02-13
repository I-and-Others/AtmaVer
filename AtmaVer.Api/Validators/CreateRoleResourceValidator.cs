using FluentValidation;
using AtmaVer.Api.DTO.RoleDTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AtmaVer.Api.DTO;

namespace AtmaVer.Api.Validators
{
    public class CreateRoleResourceValidator : AbstractValidator<CreateRoleDTO>
    {
        public CreateRoleResourceValidator()
        {
            RuleFor(a => a.Name)
              .NotEmpty()
              .WithMessage("Ad boş geçilemez")
              .MaximumLength(50);
        }
    }
}