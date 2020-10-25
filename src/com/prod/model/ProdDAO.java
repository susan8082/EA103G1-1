package com.prod.model;


	import java.io.InputStream;
import java.sql.*;
	import java.util.*;

	import javax.naming.Context;
	import javax.naming.InitialContext;
	import javax.naming.NamingException;
	import javax.sql.DataSource;

	public class ProdDAO  implements ProdDAO_interface {
		// 一個應用程式中,針對一個資料庫 ,共用一個DataSource即可
		private static DataSource ds = null;
		static {
			try {
				Context ctx = new InitialContext();
				ds = (DataSource) ctx.lookup("java:comp/env/jdbc/EA103G1");
			} catch (NamingException e) {
				e.printStackTrace();
			}
		}

		
		private static final String INSERT_STMT = "INSERT INTO PRODUCT(PROD_NO, PTR_NO, MA_NO, PROD_NAME, PROD_PRICE, PROD_DETAIL ,PROD_STATUS, PROD_PIC )   VALUES(PROD_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?)";
		private static final String UPDATE = "UPDATE PRODUCT SET  PTR_NO=?, MA_NO=?, PROD_NAME=?, PROD_PRICE=?, PROD_DETAIL=?, PROD_STATUS=?, PROD_PIC=? WHERE PROD_NO=?";
		private static final String UPDATE_NOPIC = "UPDATE PRODUCT SET  PTR_NO=?, MA_NO=?, PROD_NAME=?, PROD_PRICE=?, PROD_DETAIL=?, PROD_STATUS=? WHERE PROD_NO=?";
		private static final String GET_ALL_STMT = "SELECT * FROM PRODUCT ORDER BY PROD_NO";
		private static final String GET_ONE_STMT = "SELECT * FROM PRODUCT WHERE PROD_NO = ?";
		private static final String DELETE = "DELETE FROM PRODUCT WHERE PROD_NO = ?";
		private static final String GET_PIC = "SELECT prod_pic FROM product WHERE prod_pic IS NOT NULL AND prod_no=";
		private static final String GET_SEARCH = "SELECT * FROM PRODUCT WHERE PROD_NAME LIKE ?";		
		private static final String CHANGE_STATUS = "UPDATE PRODUCT SET  PROD_STATUS=? WHERE PROD_NO=?";
		private static final String GET_ALL_STMT_STATUS = "SELECT * FROM PRODUCT WHERE PROD_STATUS = 1  ORDER BY PROD_NO";
		private static final String GET_MA_QUERY = "SELECT * FROM PRODUCT WHERE ma_no = ? AND PROD_STATUS = 1";
		private static final String GET_FUZZY_QUERY = "SELECT * FROM PRODUCT WHERE PROD_NAME LIKE ? AND PROD_STATUS = 1";
		private static final String GET_PTR_QUERY = "SELECT * FROM PRODUCT WHERE ptr_no = ? AND PROD_STATUS = 1";
		private static final String GET_PTR_MA_PROD = "SELECT * FROM PRODUCT WHERE ptr_no = ? and  ma_no = ? AND PROD_STATUS = 1";
		private static final String GET_ALL_PTR = "SELECT * FROM PAINTER ORDER BY PTR_NO";
		private static final String GET_ALL_MA = "SELECT * FROM MATERIAL_DATA ORDER BY MA_NO";
		
		
		@Override
		public void insert(ProdVO prodVO) {
			Connection con = null;
			PreparedStatement pstmt = null;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(INSERT_STMT);

				pstmt.setInt(1,    prodVO.getPtr_no());
				pstmt.setString(2,    prodVO.getMa_no());
				pstmt.setString(3, prodVO.getProd_name());
				pstmt.setInt(4,    prodVO.getProd_price());
				pstmt.setString(5, prodVO.getProd_detail());
				pstmt.setInt(6,    prodVO.getProd_status());
				pstmt.setBytes(7,  prodVO.getProd_pic());
				
				pstmt.executeUpdate();

				// Handle any SQL errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. " + se.getMessage());
				// Clean up JDBC resources
			} finally {
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}
		}

		@Override
		public void update(ProdVO prodVO) {
			Connection con = null;
			PreparedStatement pstmt = null;

			try {
				con = ds.getConnection();
				if (prodVO.getProd_pic() == null) {
				pstmt = con.prepareStatement(UPDATE_NOPIC);
				pstmt.setInt(1,    prodVO.getPtr_no());
				pstmt.setString(2,    prodVO.getMa_no());
				pstmt.setString(3, prodVO.getProd_name());
				pstmt.setInt(4,    prodVO.getProd_price());
				pstmt.setString(5, prodVO.getProd_detail());
				pstmt.setInt(6,    prodVO.getProd_status());
				pstmt.setInt(7,    prodVO.getProd_no());
				pstmt.executeUpdate();
				}else {
					pstmt = con.prepareStatement(UPDATE);
					pstmt.setInt(1,    prodVO.getPtr_no());
					pstmt.setString(2, prodVO.getMa_no());
					pstmt.setString(3, prodVO.getProd_name());
					pstmt.setInt(4,    prodVO.getProd_price());
					pstmt.setString(5, prodVO.getProd_detail());
					pstmt.setInt(6,    prodVO.getProd_status());
					pstmt.setBytes(7,  prodVO.getProd_pic());
					pstmt.setInt(8,    prodVO.getProd_no());
					pstmt.executeUpdate();
				}

			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. " + se.getMessage());
				// Clean up JDBC resources
			} finally {
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}

		}

		@Override
		public void delete(Integer prod_no) {
			Connection con = null;
			PreparedStatement pstmt = null;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(DELETE);

				pstmt.setInt(1, prod_no);

				pstmt.executeUpdate();

				// Handle any SQL errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. " + se.getMessage());
				// Clean up JDBC resources
			} finally {
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}

		}

		@Override
		public ProdVO findByPrimaryKey(Integer prod_no) {
			ProdVO prodVO = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ONE_STMT);

				pstmt.setInt(1, prod_no);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					prodVO = new ProdVO();
					prodVO.setProd_no(rs.getInt("prod_no"));
					prodVO.setPtr_no(rs.getInt("ptr_no"));
					prodVO.setMa_no(rs.getString("ma_no"));
					prodVO.setProd_name(rs.getString("prod_name"));
					prodVO.setProd_price(rs.getInt("prod_price"));
					prodVO.setProd_detail(rs.getString("prod_detail"));
					prodVO.setProd_status(rs.getInt("prod_status"));
					prodVO.setProd_pic(rs.getBytes("prod_pic"));
					
				}

				// Handle any SQL errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. " + se.getMessage());
				// Clean up JDBC resources
			} finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}
			return prodVO;
		}

		@Override
		public List<ProdVO> getAll() {
			List<ProdVO> list = new ArrayList<ProdVO>();
			ProdVO prodVO = null;

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ALL_STMT);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					prodVO = new ProdVO();
					prodVO.setProd_no(rs.getInt("prod_no"));
					prodVO.setPtr_no(rs.getInt("ptr_no"));
					prodVO.setMa_no(rs.getString("ma_no"));
					prodVO.setProd_name(rs.getString("prod_name"));
					prodVO.setProd_price(rs.getInt("prod_price"));
					prodVO.setProd_detail(rs.getString("prod_detail"));
					prodVO.setProd_status(rs.getInt("prod_status"));
					prodVO.setProd_pic(rs.getBytes("prod_pic"));
					list.add(prodVO);
				}
				// Handle any SQL errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. " + se.getMessage());
				// Clean up JDBC resources
			} finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}
			return list;
		}

	//模糊查詢
		@Override
		public List<ProdVO> FuzzySearch(String prod_name) {
			
			List<ProdVO> list = new ArrayList<ProdVO>();
			ProdVO prodVO = null;

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_FUZZY_QUERY);
				pstmt.setString(1, "%"+prod_name+"%");
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					prodVO = new ProdVO();
					prodVO.setProd_no(rs.getInt("prod_no"));
					prodVO.setPtr_no(rs.getInt("ptr_no"));
					prodVO.setMa_no(rs.getString("ma_no"));
					prodVO.setProd_name(rs.getString("prod_name"));
					prodVO.setProd_price(rs.getInt("prod_price"));
					prodVO.setProd_detail(rs.getString("prod_detail"));
					prodVO.setProd_status(rs.getInt("prod_status"));
					prodVO.setProd_pic(rs.getBytes("prod_pic"));
					list.add(prodVO);
				}
				// Handle any SQL errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. " + se.getMessage());
				// Clean up JDBC resources
			} finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}
			return list;
		}
		
		
		
		


		

		@Override
		public void changeStatus(ProdVO prodVO) {
			Connection con = null;
			PreparedStatement pstmt = null;

			try {
				con = ds.getConnection();
				
				pstmt = con.prepareStatement(CHANGE_STATUS);
				pstmt.setInt(1,    prodVO.getProd_status());
				pstmt.setInt(2,    prodVO.getProd_no());
				pstmt.executeUpdate();
				

			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. " + se.getMessage());
				// Clean up JDBC resources
			} finally {
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}

		}

		@Override
		public List<ProdVO> getAll_status() {
			List<ProdVO> list = new ArrayList<ProdVO>();
			ProdVO prodVO = null;

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ALL_STMT_STATUS);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					prodVO = new ProdVO();
					prodVO.setProd_no(rs.getInt("prod_no"));
					prodVO.setPtr_no(rs.getInt("ptr_no"));
					prodVO.setMa_no(rs.getString("ma_no"));
					prodVO.setProd_name(rs.getString("prod_name"));
					prodVO.setProd_price(rs.getInt("prod_price"));
					prodVO.setProd_detail(rs.getString("prod_detail"));
					prodVO.setProd_status(rs.getInt("prod_status"));
					prodVO.setProd_pic(rs.getBytes("prod_pic"));
					list.add(prodVO);
				}
				// Handle any SQL errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. " + se.getMessage());
				// Clean up JDBC resources
			} finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}
			return list;
		}

		
//依照素材查詢商品		
		@Override
		public List<ProdVO> MaSearch(String ma_no) {		
				List<ProdVO> list = new ArrayList<ProdVO>();
				ProdVO prodVO = null;

				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;

				try {
					con = ds.getConnection();
					pstmt = con.prepareStatement(GET_MA_QUERY);
					pstmt.setString(1, ma_no);
					rs = pstmt.executeQuery();
					
					while (rs.next()) {
						prodVO = new ProdVO();
						prodVO.setProd_no(rs.getInt("prod_no"));
						prodVO.setPtr_no(rs.getInt("ptr_no"));
						prodVO.setMa_no(rs.getString("ma_no"));
						prodVO.setProd_name(rs.getString("prod_name"));
						prodVO.setProd_price(rs.getInt("prod_price"));
						prodVO.setProd_detail(rs.getString("prod_detail"));
						prodVO.setProd_status(rs.getInt("prod_status"));
						prodVO.setProd_pic(rs.getBytes("prod_pic"));
						list.add(prodVO);
					}
					// Handle any SQL errors
				} catch (SQLException se) {
					throw new RuntimeException("A database error occured. " + se.getMessage());
					// Clean up JDBC resources
				} finally {
					if (rs != null) {
						try {
							rs.close();
						} catch (SQLException se) {
							se.printStackTrace(System.err);
						}
					}
					if (pstmt != null) {
						try {
							pstmt.close();
						} catch (SQLException se) {
							se.printStackTrace(System.err);
						}
					}
					if (con != null) {
						try {
							con.close();
						} catch (Exception e) {
							e.printStackTrace(System.err);
						}
					}
				}
				return list;
			}
		
		
//依照作品查詢商品	
		@Override
		public List<ProdVO> PtrSearch(Integer ptr_no) {
			List<ProdVO> list = new ArrayList<ProdVO>();
			ProdVO prodVO = null;

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_PTR_QUERY);
				pstmt.setInt(1, ptr_no);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					prodVO = new ProdVO();
					prodVO.setProd_no(rs.getInt("prod_no"));
					prodVO.setPtr_no(rs.getInt("ptr_no"));
					prodVO.setMa_no(rs.getString("ma_no"));
					prodVO.setProd_name(rs.getString("prod_name"));
					prodVO.setProd_price(rs.getInt("prod_price"));
					prodVO.setProd_detail(rs.getString("prod_detail"));
					prodVO.setProd_status(rs.getInt("prod_status"));
					prodVO.setProd_pic(rs.getBytes("prod_pic"));
					list.add(prodVO);
				}
				// Handle any SQL errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. " + se.getMessage());
				// Clean up JDBC resources
			} finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}
			return list;
		}
		
		
		
		
		
		
		
		
		
		//同個作品不同素材查詢商品		
			@Override
			public ProdVO OthrMaSearch(Integer ptr_no, String ma_no) {
					ProdVO prodVO = null;
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
			
					try {
						con = ds.getConnection();
						pstmt = con.prepareStatement(GET_PTR_MA_PROD);
			
						pstmt.setInt(1, ptr_no);
						pstmt.setString(2, ma_no);
			
						rs = pstmt.executeQuery();
			
						while (rs.next()) {
							prodVO = new ProdVO();
							prodVO.setProd_no(rs.getInt("prod_no"));
							prodVO.setPtr_no(rs.getInt("ptr_no"));
							prodVO.setMa_no(rs.getString("ma_no"));
							prodVO.setProd_name(rs.getString("prod_name"));
							prodVO.setProd_price(rs.getInt("prod_price"));
							prodVO.setProd_detail(rs.getString("prod_detail"));
							prodVO.setProd_status(rs.getInt("prod_status"));
							prodVO.setProd_pic(rs.getBytes("prod_pic"));
							
						}
			
						// Handle any SQL errors
					} catch (SQLException se) {
						throw new RuntimeException("A database error occured. " + se.getMessage());
						// Clean up JDBC resources
					} finally {
						if (rs != null) {
							try {
								rs.close();
							} catch (SQLException se) {
								se.printStackTrace(System.err);
							}
						}
						if (pstmt != null) {
							try {
								pstmt.close();
							} catch (SQLException se) {
								se.printStackTrace(System.err);
							}
						}
						if (con != null) {
							try {
								con.close();
							} catch (Exception e) {
								e.printStackTrace(System.err);
							}
						}
					}
					return prodVO;
				}

			@Override
			public List<ProdVO> getAllptr() {
				
					List<ProdVO> list = new ArrayList<ProdVO>();
					ProdVO prodVO = null;

					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;

					try {
						con = ds.getConnection();
						pstmt = con.prepareStatement(GET_ALL_PTR);
						rs = pstmt.executeQuery();

						while (rs.next()) {
							prodVO = new ProdVO();
							prodVO.setPtr_no(rs.getInt("ptr_no"));
							list.add(prodVO);
						}
						// Handle any SQL errors
					} catch (SQLException se) {
						throw new RuntimeException("A database error occured. " + se.getMessage());
						// Clean up JDBC resources
					} finally {
						if (rs != null) {
							try {
								rs.close();
							} catch (SQLException se) {
								se.printStackTrace(System.err);
							}
						}
						if (pstmt != null) {
							try {
								pstmt.close();
							} catch (SQLException se) {
								se.printStackTrace(System.err);
							}
						}
						if (con != null) {
							try {
								con.close();
							} catch (Exception e) {
								e.printStackTrace(System.err);
							}
						}
					}
					return list;
				}

				
				
				
			@Override
			public List<ProdVO> getAllma() {
				
					List<ProdVO> list = new ArrayList<ProdVO>();
					ProdVO prodVO = null;

					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;

					try {
						con = ds.getConnection();
						pstmt = con.prepareStatement(GET_ALL_MA);
						rs = pstmt.executeQuery();

						while (rs.next()) {
							prodVO = new ProdVO();
							prodVO.setMa_no(rs.getString("ma_no"));
							list.add(prodVO);
						}
						// Handle any SQL errors
					} catch (SQLException se) {
						throw new RuntimeException("A database error occured. " + se.getMessage());
						// Clean up JDBC resources
					} finally {
						if (rs != null) {
							try {
								rs.close();
							} catch (SQLException se) {
								se.printStackTrace(System.err);
							}
						}
						if (pstmt != null) {
							try {
								pstmt.close();
							} catch (SQLException se) {
								se.printStackTrace(System.err);
							}
						}
						if (con != null) {
							try {
								con.close();
							} catch (Exception e) {
								e.printStackTrace(System.err);
							}
						}
					}
					return list;
				}




}


	
				

				
	
		
			
		

