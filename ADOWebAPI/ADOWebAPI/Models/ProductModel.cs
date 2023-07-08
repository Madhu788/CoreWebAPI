using System.ComponentModel.DataAnnotations.Schema;

namespace ADOWebAPI.Models
{
    public class ProductModel
    {
        //primary key property 
        public Guid ProductId { get; set; }
        //foreign key property 
        public Guid SupplierId { get; set; }
        public string ProductName { get; set; }
        public DateTime CreatedOn { get; set; }
        public decimal UnitPrice { get; set; }
        public Boolean IsActive { get; set; }
       }
}


