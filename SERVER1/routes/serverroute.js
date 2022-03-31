var express = require('express');
var server_router = express.Router();
var service = require('../service/service');

//http://localhost:8080/server/
server_router.post("/",(req,res)=>{
    res.send("Server Router Works!<br>Welcome to SJIT Placement Admin Portal!");
});

//http://localhost:8080/uploadForm
server_router.post("/uploadForm",service.uploadForm);

//http://localhost:8080/downloadForm
server_router.post("/downloadForm",service.downloadForm);

//http://localhost:8080/updateToggleStatus
server_router.post("/updateToggleStatus",service.updateToggleStatus);

//http://localhost:8080/getCurrentToggleStatus
server_router.post("/getCurrentToggleStatus",service.getCurrentToggleStatus);

//http://localhost:8080/dwnDataJSON
server_router.get("/dwnDataJSON",service.dwnDataJSON);

//http://localhost:8080/dwnData
server_router.get("/dwnData",service.dwnData);

//http://localhost:8080/getaccounts
server_router.get("/getaccounts",service.getaccounts);

//http://localhost:8080/getoneaccount
server_router.post("/getoneaccount",service.getoneaccount);


//http://localhost:8080/createaccount
server_router.post("/createaccount",service.createaccount);

//http://localhost:8080/getintern
server_router.post("/getintern",service.getintern);

//http://localhost:8080/getinterndet
server_router.post("/getinterndet",service.getinterndet);

//http://localhost:8080/uploadintern
server_router.post("/uploadintern",service.uploadintern);

//http://localhost:8080/getws
server_router.post("/getws",service.getws);

//http://localhost:8080/getwsdet
server_router.post("/getwsdet",service.getwsdet);

//http://localhost:8080/uploadws
server_router.post("/uploadws",service.uploadws);

//http://localhost:8080/getcourse
server_router.post("/getcourse",service.getcourse);

//http://localhost:8080/getcoursedet
server_router.post("/getcoursedet",service.getcoursedet);

//http://localhost:8080/uploadcourse
server_router.post("/uploadcourse",service.uploadcourse);

//http://localhost:8080/uploadFileFB
server_router.post("/uploadFileFB",service.uploadFileFB);

//http://localhost:8080/getworkshop
server_router.post("/getworkshop",service.getworkshop);

//http://localhost:8080/uploadworkshop
server_router.post("/uploadworkshop",service.uploadworkshop);

//http://localhost:8080/getoneprofile
server_router.post("/getoneprofile",service.getoneprofile);

//http://localhost:8080/uploadppdata
server_router.post("/uploadppdata",service.uploadppdata);

//http://localhost:8080/getgenealD
server_router.post("/getgenealD",service.getgenealD);

//http://localhost:8080/uploadgenealD
server_router.post("/uploadgenealD",service.uploadgenealD);

//http://localhost:8080/updategenealD
server_router.post("/updategenealD",service.updategenealD);

//http://localhost:8080/getEducationD
server_router.post("/getEducationD",service.getEducationD);

//http://localhost:8080/uploadEducationD
server_router.post("/uploadEducationD",service.uploadEducationD);

//http://localhost:8080/updateEducationD
server_router.post("/updateEducationD",service.updateEducationD);

//http://localhost:8080/getCurrentD
server_router.post("/getCurrentD",service.getCurrentD);

//http://localhost:8080/uploadCurrentD
server_router.post("/uploadCurrentD",service.uploadCurrentD);

//http://localhost:8080/updateCurrentD
server_router.post("/updateCurrentD",service.updateCurrentD);

//http://localhost:8080/getPersonalD
server_router.post("/getPersonalD",service.getPersonalD);

//http://localhost:8080/uploadPersonalD
server_router.post("/uploadPersonalD",service.uploadPersonalD);

//http://localhost:8080/updatePersonalD
server_router.post("/updatePersonalD",service.updatePersonalD);

//http://localhost:8080/getExtraD
server_router.post("/getExtraD",service.getExtraD);

//http://localhost:8080/uploadExtraD
server_router.post("/uploadExtraD",service.uploadExtraD);

//http://localhost:8080/updateExtraD
server_router.post("/updateExtraD",service.updateExtraD);

//http://localhost:8080/uploadppdataex
server_router.post("/uploadppdataex",service.uploadppdataex);

module.exports = server_router;