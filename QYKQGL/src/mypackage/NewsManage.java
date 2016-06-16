package mypackage;

public class NewsManage{

   	public boolean add(String newstitle,String newscontent,String newsobject,String newsaddtime){
   		DB db=new DB();
   		String sql="insert into news(news_title,news_content,news_object,news_addtime)values('"+newstitle+"','"+newscontent+"','"+newsobject+"','"+newsaddtime+"')";
		boolean result = false;
		try {
			if(db.executeUpdate(sql)==1){
				result = true;
			}else{
				result = false;
			}
		}catch (Exception e) {
			System.err.println("发布公告信息错误，错误信息："+e.getMessage());
		}
		db.close();
		return result;	
   	}
    
    public boolean delete(String newsid){
		DB db=new DB();
		boolean result = false;
		try {
			String sql="delete from news where news_id='"+newsid+"'";
			if(db.executeUpdate(sql)==1){
				result = true;
			}else{
				result = false;
			}			
		}catch (Exception e) {
			System.err.println("删除公告失败，错误信息："+e.getMessage());
		}
		db.close();
		return result;
	}
    
    public boolean update(String newsid,String newnewstitle,String newnewscontent,String newnewsobject,String newnewsaddtime){
    	DB db=new DB();
   		boolean result = false;
		String sql="update news set news_title='"+newnewstitle+"',news_content='"+newnewscontent+"',news_object='"+newnewsobject+"',news_addtime='"+newnewsaddtime+"' where news_id='"+newsid+"';";
		try {
			if(db.executeUpdate(sql)==1){
				result = true;
			}else{
				result = false;
			}
		}catch (Exception e) {
			System.err.println("公告信息更新错误，错误信息："+e.getMessage());
		}
		db.close();
		return result;
	} 
    
    public boolean update2(String newsid,String newnewstitle,String newnewscontent,String newnewsobject){
    	DB db=new DB();
   		boolean result = false;
		String sql="update news set news_title='"+newnewstitle+"',news_content='"+newnewscontent+"',news_object='"+newnewsobject+"' where news_id='"+newsid+"';";
		try {
			if(db.executeUpdate(sql)==1){
				result = true;
			}else{
				result = false;
			}
		}catch (Exception e) {
			System.err.println("公告信息更新错误，错误信息："+e.getMessage());
		}
		db.close();
		return result;
	} 
}