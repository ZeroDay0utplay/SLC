
module.exports.sendMail = async({from, to, subject, text}) =>{

    try {
      let mailOptions = ({
        from,
        to,
        subject,
        text
    })
    const Transporter = nodemailer.createTransport({
        service: "gmail",
        auth: {
          user: process.env.EMAIL,
          pass: process.env.EMAIL_PWD,
        },
      });
  
      return await Transporter.sendMail(mailOptions);
      
    } catch (error) {
      console.log(error)
    }
      
  }
  