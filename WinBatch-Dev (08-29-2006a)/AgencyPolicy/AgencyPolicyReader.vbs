'FamiliesFirst c2003
'Agency Policy Script 
'This file must be saved as VBS to execute properly
'
'Usage START /WAIT AgencyPolicyReader.vbs %USERNAME% %USERDOMAIN% %COMPUTERNAME%

OPTION EXPLICIT 
Dim BUTTONS 		'defines message box buttons and modal
Dim COMPUTERNAME	
DIM MESSAGE1	
DIM MESSAGE2
DIM RECID		'Tracks the pending record ID
Dim RESPONSE		'Tracks user press OK
Dim TITLE		'Title bar on message window
DIM USERDOMAIN
Dim USERNAME

CONST dbServer = "appdev"

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Here is the area that you can edit 

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'This is the database connection data 
Dim CONNECTIONSTRING
CONNECTIONSTRING = "Provider=SQLOLEDB;Data Source=" & dbServer & ";User Id=WAN_User;password=PolicyUser; Initial Catalog=AgencyPolicy"

'You can change this too
TITLE = "FamiliesFirst Inc Agency Policy"
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Ok, do not edit anything else


'Set some default values
BUTTONS = vbOKCancel + vbSystemModal + vbMsgBoxSetForeground + vbExclamation
UserName = "UnDefined"
UserDomain = "UnDefined"
ComputerName = "UnDefined"


'Check for passed in parameters
IF WScript.Arguments.Count > 0 THEN
	UserName = WScript.Arguments(0)
END IF
IF WScript.Arguments.Count > 1 THEN
	UserDomain = WScript.Arguments(1)
END IF
IF WScript.Arguments.Count > 2 THEN
	ComputerName = WScript.Arguments(2)
END IF


'Make 1st log entry and grab the record ID
RECID = Logger1()


'FUNCTIONS AND SUBROUTINES
FUNCTION Logger1 ()
	'Build SQL and return new record ID

	Const DBExecute_adStateOpen = &H00000001
	Dim oConn
	Dim oRS

	On Error Resume Next
	    Set oConn = CreateObject("ADODB.Connection")
	    oConn.Open CONNECTIONSTRING 
	    Set oRS = createobject("ADODB.Recordset")
	Err.Clear

	dim psql
	pSQL = "SELECT id, promptTag_vc, prompt_text FROM AgencyPolicyPrompts WHERE (promptTag_vc LIKE 'p1.%') ORDER BY promptTag_vc"

	oRS.Open pSQL, oConn

  	If Err.Number = 0 Then
     	IF NOT oRS.EOF THEN
			Logger1 = oRS(0)
		ELSE
			Logger1 = -1
		END IF
	ELSE
		Logger1 = 0
	End If

	If oConn.State = DBExecute_adStateOpen Then
		oConn.Close
	End If
	Set oRS = Nothing               'cleanup
END FUNCTION 


'END OF SCRIPT

