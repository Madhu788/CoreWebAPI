namespace ADOWebAPI.Models
{
    /// <summary>
    /// Customer Model
    /// </summary>
    public class CustomerModel
    {
        //primary key property 
        public Guid UserID { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime CreatedOn { get; set; }
        public Boolean IsActive { get; set; }

    }
}
