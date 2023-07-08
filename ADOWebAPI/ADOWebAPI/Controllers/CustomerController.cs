using ADOWebAPI.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Runtime.CompilerServices;

namespace ADOWebAPI.Controllers
{
    [ApiController]
    public class CustomerController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly SqlConnection con;
        private SqlCommand cmd;
        private SqlDataAdapter da;
        private DataTable dt;
        public CustomerController(IConfiguration config)
        {
            this._configuration = config;
            this.con = new SqlConnection(_configuration.GetConnectionString("DefaultConnection"));          
            
        }

        /// <summary>
        /// Get Customers data from DB
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("GetAllCustomers")]
        public async Task<IActionResult> GetAllCustomers()
        {
            try
            {
                List<CustomerModel> list = new List<CustomerModel>();
                this.cmd = new SqlCommand("SELECT * FROM [UMBRACOPOC].[dbo].[Customer]", this.con);
                this.da = new SqlDataAdapter(cmd);
                this.dt = new DataTable();

                da.Fill(dt);
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    CustomerModel custObj = new CustomerModel();
                    custObj.UserID = Guid.Parse(dt.Rows[i]["UserId"].ToString());
                    custObj.UserName = dt.Rows[i]["UserName"].ToString();
                    custObj.FirstName = dt.Rows[i]["FirstName"].ToString();
                    custObj.LastName = dt.Rows[i]["LastName"].ToString();
                    custObj.Email = dt.Rows[i]["Email"].ToString();
                    custObj.CreatedOn = Convert.ToDateTime(dt.Rows[i]["CreatedOn"].ToString());
                    custObj.IsActive = Convert.ToBoolean(dt.Rows[i]["IsActive"].ToString());
                    list.Add(custObj);
                }

                return Ok(list);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Unable to get customer records. Exception = " + ex.Message);

            }
        }

        /// <summary>
        /// Save a new Customer record in table
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("CreateCustomer")]
        public async Task<IActionResult> CreateCustomer(CustomerModel obj)
        {
            try
            {
                if (obj.UserID == Guid.Empty)
                {
                    return BadRequest("Customer is not found");
                }
                int val = obj.IsActive ? 1 : 0;
                this.cmd = new SqlCommand("INSERT INTO [dbo].[Customer] " +
                                    " VALUES ('" + obj.UserID + "','" + obj.UserName + "','" + obj.Email + " ','" + obj.FirstName + "','" + obj.LastName + " ','" + obj.CreatedOn + "'," + val + ")", this.con);

                this.con.Open();
                this.cmd.ExecuteNonQuery();
                this.con.Close();

                return Ok(obj);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Unable to save customer record. Exception = " + ex.Message);
            }

        }

        /// <summary>
        /// Update a Customer record in table
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("UpdateCustomer")]
        public async Task<IActionResult> UpdateCustomer(CustomerModel obj)
        {
            try
            {
                if (obj.UserID == Guid.Empty)
                {
                    return BadRequest("Customer is not found");
                }
                this.cmd = new SqlCommand("UPDATE [dbo].[Customer] " +
                                    " SET [Username] = '" + obj.UserName + "', [Email] ='" + obj.Email + "', [FirstName] ='" + obj.FirstName + "', [LastName] ='" + obj.LastName + "', [IsActive] ='" + obj.IsActive + "' WHERE [UserId] ='" + obj.UserID + "'", this.con);

                this.con.Open();
                this.cmd.ExecuteNonQuery();
                this.con.Close();

                return Ok(obj);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Unable to update customer record. Exception = " + ex.Message);

            }

        }

        /// <summary>
        /// Delete a Customer record using Customer ID
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        [HttpDelete]
        [Route("DeleteCustomer")]
        public async Task<IActionResult> DeleteCustomer(Guid Id)
        {
            try
            {
                if (Id == Guid.Empty)
                {
                    return BadRequest("Customer Id is empty");
                }
               this.cmd = new SqlCommand("DELETE [dbo].[Customer] " +
                                    "WHERE [UserId] ='" + Id + "'", this.con);

                this.con.Open();
                this.cmd.ExecuteNonQuery();
                this.con.Close();

                return Ok(Id);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Unable to delete customer record. Exception = " + ex.Message);
            }

        }

        /// <summary>
        /// Get Customers data from DB
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("GetActiveOrders")]
        public async Task<IActionResult> GetActiveOrders(bool active)
        {
            try
            {
                List<OrderModel> listOrder = new List<OrderModel>();
                this.cmd = new SqlCommand("GetActiveOrders", this.con);
                this.cmd.CommandType = CommandType.StoredProcedure;
                this.cmd.Parameters.AddWithValue("@Active" ,active);
                this.da = new SqlDataAdapter(cmd);
                this.dt = new DataTable();

                da.Fill(dt);
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    OrderModel obj = new OrderModel();
                    obj.OrderId = Guid.Parse(dt.Rows[i]["OrderId"].ToString());
                    obj.OrderBy = Guid.Parse(dt.Rows[i]["OrderBy"].ToString());
                    obj.ProductId = Guid.Parse(dt.Rows[i]["ProductId"].ToString());
                    obj.OrderStatus = dt.Rows[i]["OrderStatus"].ToString();
                    obj.OrderType = dt.Rows[i]["OrderType"].ToString();
                    obj.ShippedOn = Convert.ToDateTime(dt.Rows[i]["ShippedOn"].ToString());
                    obj.OrderedOn = Convert.ToDateTime(dt.Rows[i]["OrderedOn"].ToString());
                    obj.IsActive = Convert.ToBoolean(dt.Rows[i]["IsActive"].ToString());
                    obj.UserName = dt.Rows[i]["UserName"].ToString();
                    obj.SupplierName = dt.Rows[i]["SupplierName"].ToString();
                    obj.ProductName = dt.Rows[i]["ProductName"].ToString();
                    listOrder.Add(obj);
                }

                return Ok(listOrder);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Unable to get Order records. Exception = " + ex.Message);

            }
        }

    }
}
