'FamiliesFirst c2003
'Agency Policy Script 
'This file must be saved as VBS to execute properly
'
'Usage START /WAIT AgencyPolicy.vbs %USERNAME% %USERDOMAIN% %COMPUTERNAME%

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

'Change messages freely
MESSAGE1 ="As with all equipment, facilities and resources made available to you, "
MESSAGE1 = MESSAGE1 & VBCRLF & "the electronic assets of FamiliesFirst Inc remain the property of the Agency"
MESSAGE1 = MESSAGE1 & VBCRLF & "and should only be used for agency business. Such equipment includes but"
MESSAGE1 = MESSAGE1 & VBCRLF & "is not limited to computers, servers, e-mail systems, phones, voicemail "
MESSAGE1 = MESSAGE1 & VBCRLF & "systems, and cellular phones. "
MESSAGE1 = MESSAGE1 & VBCRLF & ""
MESSAGE1 = MESSAGE1 & VBCRLF & "Associates should not expect that information on any agency resources will "
MESSAGE1 = MESSAGE1 & VBCRLF & "be private or inaccessible to representatives of FamiliesFirst Inc. People who"
MESSAGE1 = MESSAGE1 & VBCRLF & "use FamiliesFirst's resources should not expect to have any proprietary, "
MESSAGE1 = MESSAGE1 & VBCRLF & "privacy or protected confidentiality right with respect to such use or "
MESSAGE1 = MESSAGE1 & VBCRLF & "information. In order to monitor compliance with this policy and protect "
MESSAGE1 = MESSAGE1 & VBCRLF & "its business interests, including the need to prevent any improper use of "
MESSAGE1 = MESSAGE1 & VBCRLF & "resources, the agency reserves the right to gain access to any information "
MESSAGE1 = MESSAGE1 & VBCRLF & "stored in, accessed, used, or retrieved by users of any of its resources. "


MESSAGE2 = "The Agency also reserves the right to make copies of, disclose and "
MESSAGE2 = MESSAGE2 & VBCRLF & "disseminate such information. Access to equipment or information may occur "
MESSAGE2 = MESSAGE2 & VBCRLF & "at any time and without the employee's advance knowledge or consent."
MESSAGE2 = MESSAGE2 & VBCRLF & ""
MESSAGE2 = MESSAGE2 & VBCRLF & "BY CLICKING OK and CONTINUING THE LOGIN PROCESS, YOU ARE ACKNOWLEDGING THIS AGENCY POLICY."
MESSAGE2 = MESSAGE2 & VBCRLF & ""

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


'Show the message(s)
Response=2
While response=2
	Response=MsgBox (MESSAGE1, BUTTONS, title)
Wend
Response=2
While response=2
	Response=MsgBox (MESSAGE2, BUTTONS, title)
wend

'Make 1st log entry and grab the record ID
RECID = Logger1()

'Make the final entry 
'FinalLog (RECID)



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
	pSQL = "INSERT INTO AgencyPolicy (UserName_vc, UserDomain_vc, ComputerName_vc) VALUES ('" & UserName & "','" & UserDomain & "','" & ComputerName & "')"

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


FUNCTION FinalLog (RECORDID)
	'Build Stored Proc Call and return new record ID

	Const DBExecute_adStateOpen = &H00000001
	Dim oConn
	Dim oRS

	On Error Resume Next
	    Set oConn = CreateObject("ADODB.Connection")
	    oConn.Open CONNECTIONSTRING 
	    Set oRS = createobject("ADODB.Recordset")
	Err.Clear

	dim psql
	pSQL = "EXEC USP_AckRec " & RECORDID

	oRS.Open pSQL, oConn

    	If Err.Number <> 0 Then
		Response = MSGBOX ("Error occurred during Stage two. Please contact support.", BUTTONS, Title)
		Logger1 = 0
	End If

	If oConn.State = DBExecute_adStateOpen Then
		oConn.Close
	End If
	Set oRS = Nothing               'cleanup

END FUNCTION 


'END OF SCRIPT

