const fs = require("fs");
const uuid = require("node-uuid");
const saveImage = (file) => {
  const extensionAllow = ["jpeg", "png"];
  let fileNameResult = "";
  const { mimetype, filename } = file;
  const extension = mimetype.split("/")[1];
  if (extensionAllow.includes(extension)) {
    const uid = uuid();
    const fileNameTmp = `./public/tmp/${file.filename}`;
    fileNameResult = `/images/${uid}.${extension}`;
    const fileNameOut = `./public/${fileNameResult}`;
    fs.createReadStream(fileNameTmp).pipe(fs.createWriteStream(fileNameOut));
    fs.unlink(fileNameTmp, (error) => console.log(error));
    return fileNameResult;
  }
};

module.exports = {
  saveImage,
};
