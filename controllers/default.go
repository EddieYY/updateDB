package controllers

import (
	"github.com/astaxie/beego"
	//"os/exec"
	"strings"
	"updateDB/xlsxtodb"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {
	//c.Data["Website"] = "beego.me"
	//c.Data["Email"] = "astaxie@gmail.com"
	//file, header, _ := c.GetFile("selfile") // where <<this>> is the controller and <<file>> the id of your form field

	c.TplName = "index.tpl"
}
func (c *MainController) Post() {
	//c.Data["Website"] = "beego.me"
	//c.Data["Email"] = "astaxie@gmail.com"
	//file, header, _ := c.GetFile("selfile") // where <<this>> is the controller and <<file>> the id of your form field
	flash := beego.NewFlash()
	_, h, err := c.GetFile("selfile")
	//defer f.Close()
	if err != nil {
		flash.Error("上傳失败")
		flash.Store(&c.Controller)
		//c.Redirect("/user/setting", 302)
		//		return
		beego.Error(err)
	} else {
		c.SaveToFile("selfile", "static/tmp/"+h.Filename)
		/*cmd := exec.Command("xlsxtomysql", "root:!QAZ2wsx3edc@(127.0.0.1:3306)/Eddie", "test", "static/tmp/"+h.Filename)
		err := cmd.Start()
		if err != nil {
			beego.Error(err)
		}*/
		Args := []string{beego.AppConfig.String("sqluser") + ":" + beego.AppConfig.String("sqlpwd") + "@(" +
			beego.AppConfig.String("sqlurls") + ")/" + beego.AppConfig.String("sqldb"),
			strings.Split(h.Filename, ".xlsx")[0], "static/tmp/" + h.Filename}

		//"mssql"
		//[localhost, userid, password, database, tablename, fileName]
		/*Args := []string{beego.AppConfig.String("sqlurls"), beego.AppConfig.String("sqluser"), beego.AppConfig.String("sqlpwd"),
		beego.AppConfig.String("sqldb"), strings.Split(h.Filename, ".xlsx")[0], "static/tmp/" + h.Filename}
		*/
		xlsxtodb.Xlsxtodb(Args, beego.AppConfig.String("sqltype"))

		flash.Success("上傳成功")
	}

	c.TplName = "index.tpl"
}
