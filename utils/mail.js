"use strict";
const nodemailer = require("nodemailer");

// async..await is not allowed in global scope, must use a wrapper
async function main(obj) {
  try {
    let testAccount = await nodemailer.createTestAccount();
  
    let transporter = nodemailer.createTransport({
      host: process.env.SMTP,
      port: process.env.PORT_MAIL,
      secure: false, // true for 465, false for other ports
      auth: {
        user: process.env.USER_MAIL, // generated ethereal user
        pass: process.env.PASSWORD_MAIL, // generated ethereal password
      },
      tls: {
          rejectUnauthorized: false,
      }
    });
  
    let info = await transporter.sendMail({
      to: obj.to,
      subject: obj.subject, // Subject line
      text: obj.text, // plain text body
      html: obj.html, // html body
    });
  
    console.log("Message sent: %s", info.messageId);
    return info.messageId;
} catch (error) {
    console.log(error);
}
}


module.exports = {
      main,
  };