<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.muthagroup.connectionModel.Connection_Utility"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Date"%>
<html>
<head>
<title>Delete</title>
</head>
<body>
	<%
		try {
			int story_id = Integer.parseInt(request.getParameter("story_id")); 
			Connection con = Connection_Utility.getConnection();
			System.out.println("strory = " +story_id);
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date curr_Date = new java.sql.Date(System.currentTimeMillis());
			int uid = Integer.parseInt(session.getAttribute("uid").toString());
			
			PreparedStatement ps_story = con.prepareStatement("update homepage_headlines_tbl  set enable_id=0 and updated_date="+curr_Date +" where homepage_headlines_id="+story_id);
			int up = ps_story.executeUpdate();
			if(up>0){
%>
<span id="delmsg"></span>
<%				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>

</body>
</html>