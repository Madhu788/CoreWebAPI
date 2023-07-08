namespace ADOWebAPI.Models
{
    public class SupplierModel
    {
        //primary key property 
        public Guid SupplierId { get; set; }
        public string SupplierName { get; set; }
        public DateTime CreatedOn { get; set; }
        public Boolean IsActive { get; set; }
    }
}
