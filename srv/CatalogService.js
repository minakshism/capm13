module.exports = (srv)=>{
    srv.before("UPDATE", 'EmployeeSet', (req) =>{
        if(parseFloat(req.data.salaryAmount) > 90000.00){
            req.console.error("Salary more than 90k not allowed!");
            
        }  
    });

    srv.on("boost", async(req)=>{
        try{
            const ID = req.params[0];
            console.log(ID);
            const tx = cds.tx(req);
            await tx.update(POs).with({
                GROSS_AMOUNT : round({ '+=' : 20000}, 2), NOTE : "Boosted!!"
            });

            return "Boost is Successfull";
        }catch(err){
            return "There are some issues" + err.toString();
        }
    });

    srv.on("largestOrder", async(req)=>{
        try{
            const ID = req.params[0];
            console.log(ID);
            const tx = cds.tx(req);
            const reply = await tx.read(POs).orderBy({
                GROSS_AMOUNT : 'desc'
            }).limit(1);

            return reply;
        }catch(err){
            return "There are some issues" + err.toString();
        }
    })
}