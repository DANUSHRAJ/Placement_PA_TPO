var express = require('express');
const client = require('../config/db_config');
var datapumps = require('datapumps');

const uploadFile = require("../config/upload");

const firebaseAdmin = require('firebase-admin');
const { v4: uuidv4 } = require('uuid');
const serviceAccount = require('./placement-portal-56d18-firebase-adminsdk-v7pqd-01ce02b42c.json');

var exportFromJSON = require('export-from-json');

var ExcelJs = require('exceljs');
var nodemailer = require('nodemailer');

module.exports.uploadForm = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("forms").insertOne(req.body);
        res.send("Success");
    } catch (err) {
        console.log(err);
    }
};

module.exports.downloadForm = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("forms").find();
        var resultfinal = [];
        await result.forEach(element => {
            resultfinal.push(element);
        });
        res.send(resultfinal);
    } catch (err) {
        console.log(err);
    }
};

module.exports.updateToggleStatus = async (req, res) => {
    try {
        var colls = req.body.colls;
        var value = req.body.value;
        await client.db("Cluster0").collection("collectionStatus").updateOne(
            { colName: colls },
            { $set: { status: value } },
            (err1, result1) => {
                if (err1)
                    console.log(err1);
            }
        );
        res.send("Updated Value!");
    } catch (err) {
        console.log(err);
    }
};

module.exports.getCurrentToggleStatus = async (req, res) => {
    try {
        var colls = req.body.colls;
        const result = await client.db("Cluster0").collection("collectionStatus").find({ colName : colls });
        var resultfinal = [];
        await result.forEach(element => {
            resultfinal.push(element);
        });
        var statusval = resultfinal[0].status;
        res.send(statusval + "");
    } catch (err) {
        console.log(err);
    }
};

module.exports.dwnDataJSON = async (req, res) => {
    try {
        await client.db("Cluster0").collection("profile").find({ "BATCH": req.body.batch }).toArray((err, result) => {
            if (err) {
                console.log(err);
                res.send(err);
            }
            else {
                // res.send(typeof(result));
                const fileName = 'profiledata';
                const exportType = exportFromJSON.types.csv;

                exportFromJSON({ result, fileName, exportType });
                res.send("Export successful!");
            }
        });
    } catch (err) {
        console.log(err);
    }
}

module.exports.dwnData = async (req, res) => {
    var Pump = datapumps.Pump;
    var MongodbMixin = datapumps.mixin.MongodbMixin;
    var ExcelWriterMixin = datapumps.mixin.ExcelWriterMixin;
    var pump = new Pump();

    pump
        .mixin(MongodbMixin('mongodb+srv://123:U97SEpqwM6odClph@cluster0.njoe3.mongodb.net/Cluster0?retryWrites=true&w=majority'))
        .useCollection("accounts")
        .from(pump.find())

        .mixin(ExcelWriterMixin())
        .createWorkbook('C:/College Projects/PLACEMENT PORTAL/OneSignal Trail/onesignal_trail/SERVER 1/spreadsheets/Accounts.xlsx')
        .createWorksheet('Accounts')
        .writeHeaders(['Name', 'Reg No.'])

        .process(function (account) {
            console.log(account);
            return pump.writeRow([account.name, account.regno]);
        })
        .logErrorsToConsole()
        .run()
        .then(function () {
            console.log("Done writing accounts to file");
        });
}

module.exports.sendDataToMail = async (req, res) => {
    try {
        let colName = req.body.colName;
        let batch = req.body.batch;
        let emailId = req.body.mailId;

        // Fetch all records
        let dataElements = await client.db("Cluster0").collection(colName).find({'batch':batch});

        // Convert to array
        var resultfinal = [];
        await dataElements.forEach(element => {
            resultfinal.push(element);
        });
        dataElements = resultfinal;
        if(dataElements. length > 0) {
            // Create Excel Book
            const workbook = new ExcelJs.Workbook();
            const worksheet = workbook.addWorksheet(colName.toUpperCase() + ' Details - Batch '+batch);

            // Add all column values
            let colVal = [];
            colVal.push({ header: 'S.no', key: 's_no', width: 10 });
            let element = dataElements[0];
            Object.keys(element).forEach(function (keyVal) {
                colVal.push({ header: keyVal.toString().toUpperCase(), key: keyVal.toString(), width: 10});
            });

            console.log("Success");

            // Assign to worksheet.columns at once
            worksheet.columns = colVal;

            // Feed value for S. No.
            let count = 1;
            dataElements.forEach(dataElem => {
                dataElem.s_no = count;
                worksheet.addRow(dataElem);
                count += 1;
            });

            // Bold the 1st Row - Heading
            worksheet.getRow(1).eachCell((cell) => {
                cell.font = { bold: true };
            });

            // Excel Write
            const data = await workbook.xlsx.writeFile(__dirname + '/Datas/'+(colName.toUpperCase() + ' Details - Batch '+batch)+'.xlsx');

            // Mail using nodemailer
            // App name: admin_sjit_pp -----  DONT CHANGE IT
            var mail = nodemailer.createTransport({
                service: 'gmail',
                auth: {
                    user: 'sjitplacemantportal@gmail.com',
                    pass: 'auhshenznbmgoyks'
                }
            });
            var mailOptions = {
                from: 'sjitplacemantportal@gmail.com',
                to: emailId,
                subject: (colName.toUpperCase() + ' Details - Batch '+batch),
                text: (colName.toUpperCase() + ' Details - Batch '+ batch) + ' is attached with this mail. Thanks & Regards SJIT Placement Portal',
                attachments: [
                    {
                        filename: (colName.toUpperCase() + ' Details - Batch '+batch)+'.xlsx',
                        path: __dirname + '/Datas/'+(colName.toUpperCase() + ' Details - Batch '+batch)+'.xlsx'
                    }
                ]
            }
            mail.sendMail(mailOptions, function(error, info){
                if (error) {
                console.log(error);
                } else {
                console.log('Email sent: ' + info.response);
                }
            });
            res.send("Success");
        } else {
            res.send("No Data Found!");
        }
    } catch (e) {
        res.status(500).send(e);
    }
}

module.exports.getTokenIdByBatchNew = async (req, res) => {
    try {
        let batchval = req.body.batch;
        // print(batch);
        const result = await client.db("Cluster0").collection("accounts").find({ batch: batchval });
        var resultfinal = [];
        await result.forEach(element => {
            if (element.tokenId != null)
                resultfinal.push(element.tokenId);
        });
        // console.log(resultfinal);
        res.send({ "token": resultfinal });
    } catch (err) {
        console.log(err);
    }
};

module.exports.storeNotification = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("notification").insertOne(req.body);
        res.send("Success");
    } catch (err) {
        console.log(err);
    }
};

module.exports.displayNotification = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("notification").find({
            'batch': req.body.batch
        });
        var resultfinal = [];
        await result.forEach(element => {
            resultfinal.push(element);
        });
        res.send(resultfinal);
    } catch (err) {
        console.log(err);
    }
};

module.exports.getaccounts = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("accounts").find();
        // console.log(result);
        var resultfinal = [];
        // console.log(result);
        await result.forEach(element => {
            resultfinal.push(element);
            // console.log(element);
        });
        // console.log(resultfinal);
        res.send(resultfinal);
    } catch (err) {
        console.log(err);
    }
};
module.exports.getoneaccount = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("accounts").findOne(
            { 'regno': req.body.regno }
        );
        // console.log("Success");
        // console.log(result);
        res.send(result);
    } catch (err) {
        console.log(err);
    }
};
module.exports.createaccount = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("accounts").insertOne(
            req.body
        );
        const result1 = await client.db("Cluster0").collection("accounts").findOne(
            { 'regno': req.body.regno }
        );
        // console.log("Success");
        // console.log(result);
        res.send(result1);
    } catch (err) {
        console.log(err);
    }
};
module.exports.getintern = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("interns").find();
        var resultfinal = [];
        // console.log(result);
        await result.forEach(element => {
            resultfinal.push(element);
            // console.log(element);
        });
        // console.log(resultfinal);
        res.send(resultfinal);
    } catch (err) {
        console.log(err);
    }
};
module.exports.getinterndet = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("interns").find({
            'regno': req.body.regno
        });
        var resultfinal = [];
        // console.log(result);
        await result.forEach(element => {
            resultfinal.push(element);
            // console.log(element);
        });
        // console.log(resultfinal);
        res.send(resultfinal);
    } catch (err) {
        console.log(err);
    }
};
module.exports.uploadintern = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("interns").insertOne(req.body);
        const result1 = await client.db("Cluster0").collection("interns").findOne(
            { 'regno': req.body.regno }
        );
        res.send(result1);
    } catch (err) {
        console.log(err);
    }
};
module.exports.getws = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("workshop").find();
        var resultfinal = [];
        // console.log(result);
        await result.forEach(element => {
            resultfinal.push(element);
            // console.log(element);
        });
        // console.log(resultfinal);
        res.send(resultfinal);
    } catch (err) {
        console.log(err);
    }
};
module.exports.getwsdet = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("workshop").find({
            'regno': req.body.regno
        });
        var resultfinal = [];
        // console.log(result);
        await result.forEach(element => {
            resultfinal.push(element);
            // console.log(element);
        });
        // console.log(resultfinal);
        res.send(resultfinal);
    } catch (err) {
        console.log(err);
    }
};
module.exports.uploadws = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("workshop").insertOne(req.body);
        const result1 = await client.db("Cluster0").collection("workshop").findOne(
            { 'regno': req.body.regno }
        );
        res.send(result1);
    } catch (err) {
        console.log(err);
    }
};
module.exports.getcourse = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("course").find();
        var resultfinal = [];
        // console.log(result);
        await result.forEach(element => {
            resultfinal.push(element);
            // console.log(element);
        });
        // console.log(resultfinal);
        res.send(resultfinal);
    } catch (err) {
        console.log(err);
    }
};
module.exports.getcoursedet = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("course").find({
            'regno': req.body.regno
        });
        var resultfinal = [];
        // console.log(result);
        await result.forEach(element => {
            resultfinal.push(element);
            // console.log(element);
        });
        // console.log(resultfinal);
        res.send(resultfinal);
    } catch (err) {
        console.log(err);
    }
};
module.exports.uploadcourse = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("course").insertOne(req.body);
        const result1 = await client.db("Cluster0").collection("course").findOne(
            { 'regno': req.body.regno }
        );
        res.send(result1);
    } catch (err) {
        console.log(err);
    }
};
const adminfb = firebaseAdmin.initializeApp({
    credential: firebaseAdmin.credential.cert(serviceAccount),
});
module.exports.uploadFileFB = async (req, res) => {
    try {
        // console.log("Body: "+ req.body.file);
        await uploadFile(req, res);
        // console.log("File: "+req.file.filename);
        if (req.file == undefined) {
            return res.status(400).send({ message: "Please upload a file!" });
        }

        const storageRef = adminfb.storage().bucket(`gs://placement-portal-56d18.appspot.com`);
        (async () => {
            path = './config/uploads/' + req.file.filename;

            storage = await storageRef.upload(path.toString(), {
                public: true,
                destination: `uploads/files/${req.file.filename}`,
                metadata: {
                    firebaseStorageDownloadTokens: uuidv4(),
                }
            });
            let url = storage[0].metadata.mediaLink;
            console.log(url);

            // const result = await client.db("resto").collection("foddetimg").insertOne({
            //     'name':req.body.name,
            //     'filename':req.file.originalname,
            //     'filelocfb':url
            // });

            // const result1 = await client.db("resto").collection("foddet").updateMany(
            //     {name: req.body.name},
            //      {$set: {path: url}},
            //      (err1,result1)=>{
            //          if(err1)
            //              console.log(err1);
            //      }
            //  );

            res.status(200).send(url);
        })();
    } catch (err) {
        console.log(err);

        if (err.code == "LIMIT_FILE_SIZE") {
            return res.status(500).send({
                message: "File size cannot be larger than 2MB!",
            });
        }

        res.status(500).send({
            message: `Could not upload the file: ${req.file.originalname}. ${err}`,
        });
    }
}
module.exports.getworkshop = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("workshop").find();
        var resultfinal = [];
        await result.forEach(element => {
            resultfinal.push(element);
        });
        res.send(resultfinal);
    } catch (err) {
        console.log(err);
    }
};
module.exports.uploadworkshop = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("workshop").insertOne(req.body);
        const result1 = await client.db("Cluster0").collection("workshop").findOne(
            { 'regno': req.body.regno }
        );
        res.send(result1);
    } catch (err) {
        console.log(err);
    }
};
module.exports.getoneprofile = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("profile").findOne(
            { 'regno': req.body.regno }
        );
        res.send(result);
    } catch (err) {
        console.log(err);
    }
};
module.exports.uploadppdata = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("profile").insertOne(req.body);
        const result1 = await client.db("Cluster0").collection("profile").findOne(
            { 'regno': req.body.regno }
        );
        res.send(result1);
    } catch (err) {
        console.log(err);
    }
};
module.exports.getgenealD = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("profile").findOne(
            { 'regno': req.body.regno }
        );
        res.send(result);
    } catch (err) {
        console.log(err);
    }
};
module.exports.uploadgenealD = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("profile").insertOne(req.body);
        const result1 = await client.db("Cluster0").collection("profile").findOne(
            { 'regno': req.body.regno }
        );
        res.send(result1);
    } catch (err) {
        console.log(err);
    }
};
module.exports.updategenealD = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("profile").update(
            { regno: req.body.regno },
            { $set: req.body },
            (err1, result) => {
                if (err1)
                    console.log(err1);
            }
        );
        const result1 = await client.db("Cluster0").collection("profile").findOne(
            { 'regno': req.body.regno }
        );
        //        console.log("Success");
        res.send(result1);
    } catch (err) {
        console.log(err);
    }
};
module.exports.getEducationD = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("profile").findOne(
            { 'regno': req.body.regno }
        );
        res.send(result);
    } catch (err) {
        console.log(err);
    }
};
module.exports.uploadEducationD = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("profile").insertOne(req.body);
        const result1 = await client.db("Cluster0").collection("profile").findOne(
            { 'regno': req.body.regno }
        );
        res.send(result1);
    } catch (err) {
        console.log(err);
    }
};
module.exports.updateEducationD = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("profile").update(
            { regno: req.body.regno },
            { $set: req.body },
            (err1, result) => {
                if (err1)
                    console.log(err1);
            }
        );
        const result1 = await client.db("Cluster0").collection("profile").findOne(
            { 'regno': req.body.regno }
        );
        res.send(result1);
    } catch (err) {
        console.log(err);
    }
};
module.exports.getCurrentD = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("profile").findOne(
            { 'regno': req.body.regno }
        );
        res.send(result);
    } catch (err) {
        console.log(err);
    }
};
module.exports.uploadCurrentD = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("profile").insertOne(req.body);
        const result1 = await client.db("Cluster0").collection("profile").findOne(
            { 'regno': req.body.regno }
        );
        res.send(result1);
    } catch (err) {
        console.log(err);
    }
};
module.exports.updateCurrentD = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("profile").update(
            { regno: req.body.regno },
            { $set: req.body },
            (err1, result) => {
                if (err1)
                    console.log(err1);
            }
        );
        const result1 = await client.db("Cluster0").collection("profile").findOne(
            { 'regno': req.body.regno }
        );
        res.send(result1);
    } catch (err) {
        console.log(err);
    }
};
module.exports.getPersonalD = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("profile").findOne(
            { 'regno': req.body.regno }
        );
        res.send(result);
    } catch (err) {
        console.log(err);
    }
};
module.exports.uploadPersonalD = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("profile").insertOne(req.body);
        const result1 = await client.db("Cluster0").collection("profile").findOne(
            { 'regno': req.body.regno }
        );
        // console.log("Success");
        res.send(result1);
    } catch (err) {
        console.log(err);
    }
};
module.exports.updatePersonalD = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("profile").update(
            { regno: req.body.regno },
            { $set: req.body },
            (err1, result) => {
                if (err1)
                    console.log(err1);
            }
        );
        const result1 = await client.db("Cluster0").collection("profile").findOne(
            { 'regno': req.body.regno }
        );
        // console.log("Success");
        res.send(result1);
    } catch (err) {
        console.log(err);
    }
};

module.exports.getExtraD = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("profile").findOne(
            { 'regno': req.body.regno }
        );
        res.send(result);
    } catch (err) {
        console.log(err);
    }
};
module.exports.uploadExtraD = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("profile").insertOne(req.body);
        const result1 = await client.db("Cluster0").collection("profile").findOne(
            { 'regno': req.body.regno }
        );
        // console.log("Success");
        res.send(result1);
    } catch (err) {
        console.log(err);
    }
};
module.exports.updateExtraD = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("profile").update(
            { regno: req.body.regno },
            { $set: req.body },
            (err1, result) => {
                if (err1)
                    console.log(err1);
            }
        );
        const result1 = await client.db("Cluster0").collection("profile").findOne(
            { 'regno': req.body.regno }
        );
        // console.log("Success");
        res.send(result1);
    } catch (err) {
        console.log(err);
    }
};

module.exports.uploadppdataex = async (req, res) => {
    try {
        const result = await client.db("Cluster0").collection("profile").update(
            { regno: req.body.regno },
            { $set: req.body },
            (err1, result) => {
                if (err1)
                    console.log(err1);
            }
        );
        const result1 = await client.db("Cluster0").collection("profile").findOne(
            { 'regno': req.body.regno }
        );
        res.send(result1);
    } catch (err) {
        console.log(err);
    }
};