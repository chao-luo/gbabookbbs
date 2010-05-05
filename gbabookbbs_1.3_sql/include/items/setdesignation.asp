﻿<%
If Not INGBABOOK Then
	Response.Write "ACCESS DENIED"
	Response.End()
End If

If Action = "useitem" Then
	Dim Designation, Color

	Designation = SafeRequest(2, "designation", 1, "", 0)
	Color = SafeRequest(2, "color", 1, "", 0)

	If Len(Designation) > 0 Then
		'Call RQ.showTips("请填写好称号内容。", "", "")
		'词语过滤
		Designation = WordsFilter(Designation)

		'验证长度
		Designation = IIF(Len(Designation) > 30, Left(Designation, 30), Designation)

		'正则表达式验证颜色代码
		If RegExpTest("^#([0-9a-fA-F]{6}$)", Color) Then
			Designation = "<font color="""& Color &""">"& Designation &"</font>"
		End If
	End If

	RQ.Execute("UPDATE "& TablePre &"memberfields SET designation = N'"& Designation &"' WHERE uid = "& RQ.UserID)

	If ItemIflog = 1 Then
		Call RQ.SetItemUserLog(ItemID, RQ.UserID, RQ.UserName, "设置称号")
	End If

	Call closeDatabase()
	Call RQ.showTips(ItemName &"使用成功。", "", "HALTED")
Else
	Response.Write "<div class=""warning"">自定义称号不支持Html，最多30个字。<br />提交后，自定义称号将立即生效，原称号将被覆盖。<br />留空提交则会删除现有称号。</div><br /><table width=""98%"" border=""0"" cellpadding=""0"" cellspacing=""0"" class=""tblborder""><tr class=""header""><td colspan=""2"">"& ItemName &"</td></tr><tr><td width=""30%"">请输入自定义称号：</td><td><input type=""text"" name=""designation"" size=""25"" maxlength=""30"" class=""inputgrey"" /> <select name=""color""><option style=""color: #f0f8ff; background: #f0f8ff"" value=""#F0F8FF"">#F0F8FF</option><option style=""color: #faebd7; background: #faebd7"" value=""#FAEBD7"">#FAEBD7</option><option style=""color: #00ffff; background: #00ffff"" value=""#00FFFF"">#00FFFF</option><option style=""color: #7fffd4; background: #7fffd4"" value=""#7FFFD4"">#7FFFD4</option><option style=""color: #f0ffff; background: #f0ffff"" value=""#F0FFFF"">#F0FFFF</option><option style=""color: #f5f5dc; background: #f5f5dc"" value=""#F5F5DC"">#F5F5DC</option><option style=""color: #ffe4c4; background: #ffe4c4"" value=""#FFE4C4"">#FFE4C4</option><option style=""color: #ffebcd; background: #ffebcd"" value=""#FFEBCD"">#FFEBCD</option><option style=""color: #0000ff; background: #0000ff"" value=""#0000FF"">#0000FF</option><option style=""color: #8a2be2; background: #8a2be2"" value=""#8A2BE2"">#8A2BE2</option><option style=""color: #deb887; background: #deb887"" value=""#DEB887"">#DEB887</option><option style=""color: #5f9ea0; background: #5f9ea0"" value=""#5F9EA0"">#5F9EA0</option><option style=""color: #7fff00; background: #7fff00"" value=""#7FFF00"">#7FFF00</option><option style=""color: #d2691e; background: #d2691e"" value=""#D2691E"">#D2691E</option><option style=""color: #ff7f50; background: #ff7f50"" value=""#FF7F50"">#FF7F50</option><option style=""color: #000000; background: #000000"" value="""" selected>#000000</option><option style=""color: #1e90ff; background: #1e90ff"" value=""#1E90FF"">#1E90FF</option><option style=""color: #696969; background: #696969"" value=""#696969"">#696969</option><option style=""color: #6495ed; background: #6495ed"" value=""#6495ED"">#6495ED</option><option style=""color: #fff8dc; background: #fff8dc"" value=""#FFF8DC"">#FFF8DC</option><option style=""color: #00ffff; background: #00ffff"" value=""#00FFFF"">#00FFFF</option><option style=""color: #00008b; background: #00008b"" value=""#00008B"">#00008B</option><option style=""color: #008b8b; background: #008b8b"" value=""#008B8B"">#008B8B</option><option style=""color: #b8860b; background: #b8860b"" value=""#B8860B"">#B8860B</option><option style=""color: #a9a9a9; background: #a9a9a9"" value=""#A9A9A9"">#A9A9A9</option><option style=""color: #006400; background: #006400"" value=""#006400"">#006400</option><option style=""color: #bdb76b; background: #bdb76b"" value=""#BDB76B"">#BDB76B</option><option style=""color: #8b008b; background: #8b008b"" value=""#8B008B"">#8B008B</option><option style=""color: #556b2f; background: #556b2f"" value=""#556B2F"">#556B2F</option><option style=""color: #ff8c00; background: #ff8c00"" value=""#FF8C00"">#FF8C00</option><option style=""color: #9932cc; background: #9932cc"" value=""#9932CC"">#9932CC</option><option style=""color: #8b0000; background: #8b0000"" value=""#8B0000"">#8B0000</option><option style=""color: #e9967a; background: #e9967a"" value=""#E9967A"">#E9967A</option><option style=""color: #8fbc8f; background: #8fbc8f"" value=""#8FBC8F"">#8FBC8F</option><option style=""color: #483d8b; background: #483d8b"" value=""#483D8B"">#483D8B</option><option style=""color: #2f4f4f; background: #2f4f4f"" value=""#2F4F4F"">#2F4F4F</option><option style=""color: #00ced1; background: #00ced1"" value=""#00CED1"">#00CED1</option><option style=""color: #9400d3; background: #9400d3"" value=""#9400D3"">#9400D3</option><option style=""color: #ff1493; background: #ff1493"" value=""#FF1493"">#FF1493</option><option style=""color: #00bfff; background: #00bfff"" value=""#00BFFF"">#00BFFF</option><option style=""color: #fffaf0; background: #fffaf0"" value=""#FFFAF0"">#FFFAF0</option><option style=""color: #228b22; background: #228b22"" value=""#228B22"">#228B22</option><option style=""color: #ff00ff; background: #ff00ff"" value=""#FF00FF"">#FF00FF</option><option style=""color: #dcdcdc; background: #dcdcdc"" value=""#DCDCDC"">#DCDCDC</option><option style=""color: #f8f8ff; background: #f8f8ff"" value=""#F8F8FF"">#F8F8FF</option><option style=""color: #ffd700; background: #ffd700"" value=""#FFD700"">#FFD700</option><option style=""color: #daa520; background: #daa520"" value=""#DAA520"">#DAA520</option><option style=""color: #808080; background: #808080"" value=""#808080"">#808080</option><option style=""color: #008000; background: #008000"" value=""#008000"">#008000</option><option style=""color: #adff2f; background: #adff2f"" value=""#ADFF2F"">#ADFF2F</option><option style=""color: #f0fff0; background: #f0fff0"" value=""#F0FFF0"">#F0FFF0</option><option style=""color: #ff69b4; background: #ff69b4"" value=""#FF69B4"">#FF69B4</option><option style=""color: #cd5c5c; background: #cd5c5c"" value=""#CD5C5C"">#CD5C5C</option><option style=""color: #4b0082; background: #4b0082"" value=""#4B0082"">#4B0082</option><option style=""color: #fffff0; background: #fffff0"" value=""#FFFFF0"">#FFFFF0</option><option style=""color: #f0e68c; background: #f0e68c"" value=""#F0E68C"">#F0E68C</option><option style=""color: #e6e6fa; background: #e6e6fa"" value=""#E6E6FA"">#E6E6FA</option><option style=""color: #fff0f5; background: #fff0f5"" value=""#FFF0F5"">#FFF0F5</option><option style=""color: #7cfc00; background: #7cfc00"" value=""#7CFC00"">#7CFC00</option><option style=""color: #fffacd; background: #fffacd"" value=""#FFFACD"">#FFFACD</option><option style=""color: #add8e6; background: #add8e6"" value=""#ADD8E6"">#ADD8E6</option><option style=""color: #f08080; background: #f08080"" value=""#F08080"">#F08080</option><option style=""color: #e0ffff; background: #e0ffff"" value=""#E0FFFF"">#E0FFFF</option><option style=""color: #fafad2; background: #fafad2"" value=""#FAFAD2"">#FAFAD2</option><option style=""color: #90ee90; background: #90ee90"" value=""#90EE90"">#90EE90</option><option style=""color: #d3d3d3; background: #d3d3d3"" value=""#D3D3D3"">#D3D3D3</option><option style=""color: #ffb6c1; background: #ffb6c1"" value=""#FFB6C1"">#FFB6C1</option><option style=""color: #ffa07a; background: #ffa07a"" value=""#FFA07A"">#FFA07A</option><option style=""color: #20b2aa; background: #20b2aa"" value=""#20B2AA"">#20B2AA</option><option style=""color: #87cefa; background: #87cefa"" value=""#87CEFA"">#87CEFA</option><option style=""color: #778899; background: #778899"" value=""#778899"">#778899</option><option style=""color: #b0c4de; background: #b0c4de"" value=""#B0C4DE"">#B0C4DE</option><option style=""color: #ffffe0; background: #ffffe0"" value=""#FFFFE0"">#FFFFE0</option><option style=""color: #00ff00; background: #00ff00"" value=""#00FF00"">#00FF00</option><option style=""color: #32cd32; background: #32cd32"" value=""#32CD32"">#32CD32</option><option style=""color: #faf0e6; background: #faf0e6"" value=""#FAF0E6"">#FAF0E6</option><option style=""color: #ff00ff; background: #ff00ff"" value=""#FF00FF"">#FF00FF</option><option style=""color: #800000; background: #800000"" value=""#800000"">#800000</option><option style=""color: #66cdaa; background: #66cdaa"" value=""#66CDAA"">#66CDAA</option><option style=""color: #0000cd; background: #0000cd"" value=""#0000CD"">#0000CD</option><option style=""color: #ba55d3; background: #ba55d3"" value=""#BA55D3"">#BA55D3</option><option style=""color: #9370db; background: #9370db"" value=""#9370DB"">#9370DB</option><option style=""color: #3cb371; background: #3cb371"" value=""#3CB371"">#3CB371</option><option style=""color: #7b68ee; background: #7b68ee"" value=""#7B68EE"">#7B68EE</option><option style=""color: #00fa9a; background: #00fa9a"" value=""#00FA9A"">#00FA9A</option><option style=""color: #48d1cc; background: #48d1cc"" value=""#48D1CC"">#48D1CC</option><option style=""color: #c71585; background: #c71585"" value=""#C71585"">#C71585</option><option style=""color: #191970; background: #191970"" value=""#191970"">#191970</option><option style=""color: #f5fffa; background: #f5fffa"" value=""#F5FFFA"">#F5FFFA</option><option style=""color: #ffe4e1; background: #ffe4e1"" value=""#FFE4E1"">#FFE4E1</option><option style=""color: #ffe4b5; background: #ffe4b5"" value=""#FFE4B5"">#FFE4B5</option><option style=""color: #ffdead; background: #ffdead"" value=""#FFDEAD"">#FFDEAD</option><option style=""color: #000080; background: #000080"" value=""#000080"">#000080</option><option style=""color: #fdf5e6; background: #fdf5e6"" value=""#FDF5E6"">#FDF5E6</option><option style=""color: #808000; background: #808000"" value=""#808000"">#808000</option><option style=""color: #6b8e23; background: #6b8e23"" value=""#6B8E23"">#6B8E23</option><option style=""color: #ffa500; background: #ffa500"" value=""#FFA500"">#FFA500</option><option style=""color: #da70d6; background: #da70d6"" value=""#DA70D6"">#DA70D6</option><option style=""color: #eee8aa; background: #eee8aa"" value=""#EEE8AA"">#EEE8AA</option><option style=""color: #98fb98; background: #98fb98"" value=""#98FB98"">#98FB98</option><option style=""color: #afeeee; background: #afeeee"" value=""#AFEEEE"">#AFEEEE</option><option style=""color: #db7093; background: #db7093"" value=""#DB7093"">#DB7093</option><option style=""color: #ffefd5; background: #ffefd5"" value=""#FFEFD5"">#FFEFD5</option><option style=""color: #ffdab9; background: #ffdab9"" value=""#FFDAB9"">#FFDAB9</option><option style=""color: #cd853f; background: #cd853f"" value=""#CD853F"">#CD853F</option><option style=""color: #ffc0cb; background: #ffc0cb"" value=""#FFC0CB"">#FFC0CB</option><option style=""color: #dda0dd; background: #dda0dd"" value=""#DDA0DD"">#DDA0DD</option><option style=""color: #b0e0e6; background: #b0e0e6"" value=""#B0E0E6"">#B0E0E6</option><option style=""color: #800080; background: #800080"" value=""#800080"">#800080</option><option style=""color: #bc8f8f; background: #bc8f8f"" value=""#BC8F8F"">#BC8F8F</option><option style=""color: #4169e1; background: #4169e1"" value=""#4169E1"">#4169E1</option><option style=""color: #8b4513; background: #8b4513"" value=""#8B4513"">#8B4513</option><option style=""color: #fa8072; background: #fa8072"" value=""#FA8072"">#FA8072</option><option style=""color: #f4a460; background: #f4a460"" value=""#F4A460"">#F4A460</option><option style=""color: #2e8b57; background: #2e8b57"" value=""#2E8B57"">#2E8B57</option><option style=""color: #fff5ee; background: #fff5ee"" value=""#FFF5EE"">#FFF5EE</option><option style=""color: #a0522d; background: #a0522d"" value=""#A0522D"">#A0522D</option><option style=""color: #c0c0c0; background: #c0c0c0"" value=""#C0C0C0"">#C0C0C0</option><option style=""color: #87ceeb; background: #87ceeb"" value=""#87CEEB"">#87CEEB</option><option style=""color: #6a5acd; background: #6a5acd"" value=""#6A5ACD"">#6A5ACD</option><option style=""color: #708090; background: #708090"" value=""#708090"">#708090</option><option style=""color: #fffafa; background: #fffafa"" value=""#FFFAFA"">#FFFAFA</option><option style=""color: #00ff7f; background: #00ff7f"" value=""#00FF7F"">#00FF7F</option><option style=""color: #4682b4; background: #4682b4"" value=""#4682B4"">#4682B4</option><option style=""color: #d2b48c; background: #d2b48c"" value=""#D2B48C"">#D2B48C</option><option style=""color: #008080; background: #008080"" value=""#008080"">#008080</option><option style=""color: #d8bfd8; background: #d8bfd8"" value=""#D8BFD8"">#D8BFD8</option><option style=""color: #ff6347; background: #ff6347"" value=""#FF6347"">#FF6347</option><option style=""color: #40e0d0; background: #40e0d0"" value=""#40E0D0"">#40E0D0</option><option style=""color: #ee82ee; background: #ee82ee"" value=""#EE82EE"">#EE82EE</option><option style=""color: #f5deb3; background: #f5deb3"" value=""#F5DEB3"">#F5DEB3</option><option style=""color: #ffffff; background: #ffffff"" value=""#FFFFFF"">#FFFFFF</option><option style=""color: #f5f5f5; background: #f5f5f5"" value=""#F5F5F5"">#F5F5F5</option><option style=""color: #ffff00; background: #ffff00"" value=""#FFFF00"">#FFFF00</option><option style=""color: #9acd32; background: #9acd32"" value=""#9ACD32"">#9ACD32</option></select></td></tr><tr><td></td><td><input type=""submit"" id=""btnsubmit"" value=""确定"" class=""button"" /></td></tr></table>"
End If
%>