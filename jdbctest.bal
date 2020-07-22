import ballerina/io;
import ballerinax/java.jdbc;


# Prints `Hello World`.
jdbc:Client testDB = new ({
    url: "jdbc:sqlserver://IW-LT46:1433;databaseName=testDB",
    username: "sa",
    password: "Sample123$",
    poolOptions: { maximumPoolSize: 5 },
    dbOptions: {useSSL: false}
});

public function main() {
 executeStoredProcedure();
}

type data record{
  string response;
};

function executeStoredProcedure(){
  var retCall = testDB->call("{call testProc()}",[data]);
  if(retCall is table<record{}>[]){
    string response = retCall[0].getNext().toString();
    io:println(response);
  }else{
    io:println(retCall.toString());
  }
  
}



