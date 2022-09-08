module.exports = (srv)=>{
    srv.before("UPDATE", 'EmployeeSet', (req) =>{
        if(parseFloat(req.data.salaryAmount) > 90000.00){
            req.console.error("Salary more than 90k not allowed!");
            
        }  
    });
}