 <%
  // file = "../common/include/database_close.inc"

  // 데이터베이스 연결 종료(close database)
  if (rset != null) try {rset.close();} catch (SQLException sqlerr) {}
  if (pstmt != null) try {pstmt.close();} catch (SQLException sqlerr) {}
  if (conn != null) try {conn.close();} catch (SQLException sqlerr) {}
 %>