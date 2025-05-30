using CloudinaryDotNet;
using FurnitureStoreBE.Configurations;
using FurnitureStoreBE.Data;
using FurnitureStoreBE.Models;
using FurnitureStoreBE.Services;
using FurnitureStoreBE.Services.Authentication;
using FurnitureStoreBE.Services.Caching;
using FurnitureStoreBE.Services.CartService;
using FurnitureStoreBE.Services.CouponService;
using FurnitureStoreBE.Services.FileUploadService;
using FurnitureStoreBE.Services.ImportService;
using FurnitureStoreBE.Services.MailService;
using FurnitureStoreBE.Services.OrderService;
using FurnitureStoreBE.Services.ProductService.BrandService;
using FurnitureStoreBE.Services.ProductService.CategoryService;
using FurnitureStoreBE.Services.ProductService.ColorService;
using FurnitureStoreBE.Services.ProductService.DesignerService;
using FurnitureStoreBE.Services.ProductService.FavoriteProductService;
using FurnitureStoreBE.Services.ProductService.FurnitureTypeService;
using FurnitureStoreBE.Services.ProductService.MaterialService;
using FurnitureStoreBE.Services.ProductService.ProductService;
using FurnitureStoreBE.Services.ProductService.RoomSpaceService;
using FurnitureStoreBE.Services.QuestionService;
using FurnitureStoreBE.Services.ReviewService;
using FurnitureStoreBE.Services.Token;
using FurnitureStoreBE.Services.UserService;
using FurnitureStoreBE.Utils;
using Hangfire;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using StackExchange.Redis;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

var port = Environment.GetEnvironmentVariable("PORT");
if (port != null)
{
    builder.WebHost.UseUrls($"http://*:{port}");
}


// Add services to the container.

builder.Services.AddControllers();
builder.Services.AddHttpContextAccessor();

var databaseConnectionString = ConnectionHelper.GetDatabaseConnectionString(builder.Configuration);
builder.Services.AddDbContext<ApplicationDBContext>(options =>
    options.UseNpgsql(databaseConnectionString));

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(option =>
{
    option.SwaggerDoc("v1", new OpenApiInfo { Title = "Furniture Store API", Version = "v1" });
    option.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
    {
        In = ParameterLocation.Header,
        Description = "Please enter a valid token",
        Name = "Authorization",
        Type = SecuritySchemeType.Http,
        BearerFormat = "JWT",
        Scheme = "Bearer"
    });
    option.AddSecurityRequirement(new OpenApiSecurityRequirement
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference
                {
                    Type=ReferenceType.SecurityScheme,
                    Id="Bearer"
                }
            },
            new string[]{}
        }
    });
});
builder.Services.AddIdentity<User, IdentityRole>(options =>
{
    options.Password.RequireDigit = true;
    options.Password.RequireLowercase = true;
    options.Password.RequireUppercase = true;
    options.Password.RequireNonAlphanumeric = true;
    options.Password.RequiredLength = 8;
})
.AddEntityFrameworkStores<ApplicationDBContext>().AddRoles<IdentityRole>()
.AddDefaultTokenProviders();

builder.Services.AddAuthentication(options =>
{
    options.DefaultAuthenticateScheme =
    options.DefaultChallengeScheme =
    options.DefaultForbidScheme =
    options.DefaultScheme =
    options.DefaultSignInScheme =
    options.DefaultSignOutScheme = JwtBearerDefaults.AuthenticationScheme;
}).AddJwtBearer(o =>
{
    o.TokenValidationParameters = new TokenValidationParameters
    {
        ValidIssuer = builder.Configuration["Jwt:Issuer"],
        ValidAudience = builder.Configuration["Jwt:Audience"],
        IssuerSigningKey = new SymmetricSecurityKey
(Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"] ?? string.Empty)),
        ValidateIssuer = true,
        ValidateAudience = true,
        ValidateLifetime = true,
        ValidateIssuerSigningKey = true,
    };
});
builder.Services.AddAuthorization(options =>
{
    // User claims policies
    options.AddPolicy("CreateUserPolicy", policy => policy.RequireClaim("CreateUser"));
    options.AddPolicy("UpdateUserPolicy", policy => policy.RequireClaim("UpdateUser"));
    options.AddPolicy("DeleteUserPolicy", policy => policy.RequireClaim("DeleteUser"));

    // Brand claims policies
    options.AddPolicy("CreateBrandPolicy", policy => policy.RequireClaim("CreateBrand"));
    options.AddPolicy("UpdateBrandPolicy", policy => policy.RequireClaim("UpdateBrand"));
    options.AddPolicy("DeleteBrandPolicy", policy => policy.RequireClaim("DeleteBrand"));

    // Category claims policies
    options.AddPolicy("CreateCategoryPolicy", policy => policy.RequireClaim("CreateCategory"));
    options.AddPolicy("UpdateCategoryPolicy", policy => policy.RequireClaim("UpdateCategory"));
    options.AddPolicy("DeleteCategoryPolicy", policy => policy.RequireClaim("DeleteCategory"));

    // Color claims policies
    options.AddPolicy("CreateColorPolicy", policy => policy.RequireClaim("CreateColor"));
    options.AddPolicy("UpdateColorPolicy", policy => policy.RequireClaim("UpdateColor"));
    options.AddPolicy("DeleteColorPolicy", policy => policy.RequireClaim("DeleteColor"));

    // Coupon claims policies
    options.AddPolicy("CreateCouponPolicy", policy => policy.RequireClaim("CreateCoupon"));
    options.AddPolicy("UpdateCouponPolicy", policy => policy.RequireClaim("UpdateCoupon"));
    options.AddPolicy("DeleteCouponPolicy", policy => policy.RequireClaim("DeleteCoupon"));

    // Customer claims policies
    options.AddPolicy("CreateCustomerPolicy", policy => policy.RequireClaim("CreateCustomer"));
    options.AddPolicy("UpdateCustomerPolicy", policy => policy.RequireClaim("UpdateCustomer"));
    options.AddPolicy("DeleteCustomerPolicy", policy => policy.RequireClaim("DeleteCustomer"));

    // Designer claims policies
    options.AddPolicy("CreateDesignerPolicy", policy => policy.RequireClaim("CreateDesigner"));
    options.AddPolicy("UpdateDesignerPolicy", policy => policy.RequireClaim("UpdateDesigner"));
    options.AddPolicy("DeleteDesignerPolicy", policy => policy.RequireClaim("DeleteDesigner"));

    // FurnitureType claims policies
    options.AddPolicy("CreateFurnitureTypePolicy", policy => policy.RequireClaim("CreateFurnitureType"));
    options.AddPolicy("UpdateFurnitureTypePolicy", policy => policy.RequireClaim("UpdateFurnitureType"));
    options.AddPolicy("DeleteFurnitureTypePolicy", policy => policy.RequireClaim("DeleteFurnitureType"));

    // Material claims policies
    options.AddPolicy("CreateMaterialPolicy", policy => policy.RequireClaim("CreateMaterial"));
    options.AddPolicy("UpdateMaterialPolicy", policy => policy.RequireClaim("UpdateMaterial"));
    options.AddPolicy("DeleteMaterialPolicy", policy => policy.RequireClaim("DeleteMaterial"));

    // MaterialType claims policies
    options.AddPolicy("CreateMaterialTypePolicy", policy => policy.RequireClaim("CreateMaterialType"));
    options.AddPolicy("UpdateMaterialTypePolicy", policy => policy.RequireClaim("UpdateMaterialType"));
    options.AddPolicy("DeleteMaterialTypePolicy", policy => policy.RequireClaim("DeleteMaterialType"));

    // Notification claims policies
    options.AddPolicy("CreateNotificationPolicy", policy => policy.RequireClaim("CreateNotification"));
    options.AddPolicy("UpdateNotificationPolicy", policy => policy.RequireClaim("UpdateNotification"));
    options.AddPolicy("DeleteNotificationPolicy", policy => policy.RequireClaim("DeleteNotification"));

    // Role claims policies
    options.AddPolicy("CreateRolePolicy", policy => policy.RequireClaim("CreateRole"));
    options.AddPolicy("UpdateRolePolicy", policy => policy.RequireClaim("UpdateRole"));
    options.AddPolicy("DeleteRolePolicy", policy => policy.RequireClaim("DeleteRole"));

    // Order claims policies
    options.AddPolicy("CreateOrderPolicy", policy => policy.RequireClaim("CreateOrder"));
    options.AddPolicy("UpdateOrderPolicy", policy => policy.RequireClaim("UpdateOrder"));
    options.AddPolicy("DeleteOrderPolicy", policy => policy.RequireClaim("DeleteOrder"));

    // Product claims policies
    options.AddPolicy("CreateProductPolicy", policy => policy.RequireClaim("CreateProduct"));
    options.AddPolicy("UpdateProductPolicy", policy => policy.RequireClaim("UpdateProduct"));
    options.AddPolicy("DeleteProductPolicy", policy => policy.RequireClaim("DeleteProduct"));

    // Question claims policies
    options.AddPolicy("CreateQuestionPolicy", policy => policy.RequireClaim("CreateQuestion"));
    options.AddPolicy("UpdateQuestionPolicy", policy => policy.RequireClaim("UpdateQuestion"));
    options.AddPolicy("DeleteQuestionPolicy", policy => policy.RequireClaim("DeleteQuestion"));

    // Reply claims policies
    options.AddPolicy("CreateReplyPolicy", policy => policy.RequireClaim("CreateReply"));
    options.AddPolicy("UpdateReplyPolicy", policy => policy.RequireClaim("UpdateReply"));
    options.AddPolicy("DeleteReplyPolicy", policy => policy.RequireClaim("DeleteReply"));

    // Review claims policies
    options.AddPolicy("CreateReviewPolicy", policy => policy.RequireClaim("CreateReview"));
    options.AddPolicy("UpdateReviewPolicy", policy => policy.RequireClaim("UpdateReview"));
    options.AddPolicy("DeleteReviewPolicy", policy => policy.RequireClaim("DeleteReview"));

    // RoomSpace claims policies
    options.AddPolicy("CreateRoomSpacePolicy", policy => policy.RequireClaim("CreateRoomSpace"));
    options.AddPolicy("UpdateRoomSpacePolicy", policy => policy.RequireClaim("UpdateRoomSpace"));
    options.AddPolicy("DeleteRoomSpacePolicy", policy => policy.RequireClaim("DeleteRoomSpace"));

    // Report claims policies
    options.AddPolicy("CreateReportPolicy", policy => policy.RequireClaim("CreateReport"));
});


builder.Services.AddSingleton<Cloudinary>(serviceProvider =>
{
    var cloudinarySettings = serviceProvider.GetRequiredService<IOptions<CloudinarySettings>>().Value;
    var account = new Account(cloudinarySettings.CloudName, cloudinarySettings.ApiKey, cloudinarySettings.ApiSecret);
    return new Cloudinary(account);
});

builder.Services.AddAutoMapper(typeof(Program));

var redisConnectionString = ConnectionHelper.GetRedisConnectionString(builder.Configuration);
var options = ConfigurationOptions.Parse(redisConnectionString);
options.AbortOnConnectFail = false; // Allow retry if connection fails

try
{
    var redisConnection = ConnectionMultiplexer.Connect(options);
    builder.Services.AddSingleton<IConnectionMultiplexer>(redisConnection);
}
catch (Exception ex)
{
    Console.WriteLine($"Redis connection error: {ex.Message}");
    throw;
}



builder.Services.AddHttpClient();

builder.Services.Configure<CloudinarySettings>(builder.Configuration.GetSection("Cloudinary"));
builder.Services.AddScoped<IFileUploadService, FileUploadServiceImp>();

builder.Services.Configure<MailSettings>(builder.Configuration.GetSection("MailSettings"));
builder.Services.AddTransient<IMailService, MailServiceImp>();
builder.Services.AddScoped<IAuthService, AuthServiceImp>();
builder.Services.AddScoped<ITokenService, TokenServiceImp>();
builder.Services.AddScoped<JwtUtil>();
builder.Services.AddScoped<IRedisCacheService, RedisCacheServiceImp>();
builder.Services.AddScoped<IUserService, UserServiceImp>();
builder.Services.AddScoped<IDesignerService, DesignerServiceImp>();
builder.Services.AddScoped<IBrandService, BrandServiceImp>();
builder.Services.AddScoped<IRoomSpaceService, RoomSpaceServiceImp>();
builder.Services.AddScoped<IMaterialService, MaterialServiceImp>();
builder.Services.AddScoped<IFurnitureTypeService, FurnitureTypeServiceImp>();
builder.Services.AddScoped<ICategoryService, CategoryServiceImp>();
builder.Services.AddScoped<IColorService, ColorServiceImp>();
builder.Services.AddScoped<IProductService, ProductServiceImp>();
builder.Services.AddScoped<IFavoriteProductService, FavoriteProductServiceImp>();
builder.Services.AddScoped<ICouponService, CouponServiceImp>();
builder.Services.AddScoped<IReviewService, ReviewServiceImp>();
builder.Services.AddScoped<IQuestionService, QuestionServiceImp>();
builder.Services.AddScoped<IImportService, ImportServiceImp>();
builder.Services.AddScoped<IOrderItemService, OrderItemServiceImp>();
builder.Services.AddScoped<IOrderService, OrderServiceImp>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment() || app.Environment.IsProduction())
{
    app.UseSwagger();
    app.UseSwaggerUI();
    //DatabaseMigrationUtil.DataBaseMigrationInstallation(app);
}
using (var scope = app.Services.CreateScope())
{
    await DataHelper.ManageDataAsync(scope.ServiceProvider);
    AppUserSeeder.SeedRootAdminUser(scope, app);

}

app.UseCors(x => x
    .AllowAnyOrigin()
    .AllowAnyMethod()
    .AllowAnyHeader());
app.UseAuthentication();
app.UseAuthorization();
app.MapControllers();
app.UseExceptionHandler(opt => { });
app.UseMiddleware<LoggingMiddleware>();
app.UseMiddleware<HeaderCheckMiddleware>();
app.Run();
