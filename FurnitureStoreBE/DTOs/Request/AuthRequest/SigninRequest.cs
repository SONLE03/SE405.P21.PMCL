﻿using System.ComponentModel.DataAnnotations;

namespace FurnitureStoreBE.DTOs.Request.Auth
{
    public class SigninRequest
    {
        [Required(ErrorMessage = "Email is required.")]
        public string Email { get; set; }
        [Required(ErrorMessage = "Password is required.")]
        public string Password { get; set; }
    }
}
