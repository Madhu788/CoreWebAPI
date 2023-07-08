namespace ADOWebAPI.Models
{
    public class OrderModel
    {
        //primary key property 
        public Guid OrderId { get; set; }
        //foreign key property 
        public Guid ProductId { get; set; }
        //foreign key property 
        public Guid OrderBy { get; set; }
        public string OrderStatus { get; set; }
        public string OrderType { get; set; }
        public DateTime OrderedOn { get; set; }
        public DateTime ShippedOn { get; set; }        
        public Boolean IsActive { get; set; }
        public string UserName { get; set; }
        public string SupplierName { get; set; }
        public string ProductName { get; set; }
    }
}
