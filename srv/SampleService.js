const cds = require("@sap/cds");
const {employees} = cds.entities("minakshi.db.master");

const mydemoservice = function(srv){
    srv.on("READ", "ReadEmployeeSrv", async(req, res)=>{
        let results = [];
        // cds query language
        //results = await cds.tx(req).run(SELECT.from(employees).limit(2));
        //results = await cds.tx(req).run(SELECT.from(employees).where({"nameFirst": "Sally"}));

        //cds query if user pass key like /entity/key

        var whereconditionread = req.data;
        console.log(req.data);
        if(whereconditionread.hasOwnProperty("ID")){
            results = await cds.tx(req).run(SELECT.from(employees).where(whereconditionread));
        }else{
            results = await cds.tx(req).run(SELECT.from(employees).limit(1));
        }
        return results;
    });

    srv.on("CREATE", "InsertEmployeeSrv", async(req, res)=>{
       try{
           console.log(req.data.ID);
        let reqData = await cds.create(employees, req.data).then((resolved, reject)=>{
            if(resolved){
                return req.data;
            }
        });
        return reqData;
        
       }catch{
        req.error(500, "There are some issues in insert");
       }

    });

    srv.on("UPDATE", "UpdateEmployeeSrv", async(req,res)=>{
        try {
            let updatedData = await cds.transaction(req).run([UPDATE(employees).set({
                nameFirst : req.data.nameFirst
            }).where({ID : req.data.ID})]).then((resolved, reject)=>{
                if(resolved){
                    return req.data;
                }
            });
            return updatedData;
        }catch{
            req.error(500, "There are some issues in insert");
        }
        
    });

    srv.on("DELETE", "DeleteEmployeeSrv", async(req, res)=>{
        try{
            let deleteData = cds.tx(req).run([ 
                DELETE.from(employees).where(req.data)
            ]).then((resolved)=>{
                if(resolved){
                    return req.data;
                }
            });
    
            return deleteData;
        }catch{
            req.error(500, "There are some issues in DELETE");
        }
        
    });
    
}

module.exports = mydemoservice;