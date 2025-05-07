﻿using AutoMapper;
using FurnitureStoreBE.DTOs.Response.UserResponse;
using FurnitureStoreBE.Models;

namespace FurnitureStoreBE.Mapper
{
    public class AutoMapperConfig : Profile
    {
        public AutoMapperConfig()
        {
            CreateMap<AspNetTypeClaims, TypeClaimsResponse>();
            CreateMap<User,  UserResponse>().ForMember(dest => dest.ImageSource, opt => opt.MapFrom(src => src.Asset.URL));
            CreateMap<Address, AddressResponse>();
            
        }
    }
}
