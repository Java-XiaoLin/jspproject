package top.dreamyy.hrm.dao;

import static top.dreamyy.hrm.util.common.HrmConstants.DOCUMENTTABLE;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import top.dreamyy.hrm.dao.provider.DocumentDynaSqlProvider;
import top.dreamyy.hrm.domain.Document;

/**   
 * @Description: DocumentMapper接口
 * @version V1.0   
 */
public interface DocumentDao {

	// 动态查询
	@SelectProvider(type=DocumentDynaSqlProvider.class,method="selectWhitParam")
	@Results({
		@Result(id=true,column="id",property="id"),
		@Result(column="CREATE_DATE",property="createDate",javaType=java.util.Date.class),
		@Result(column="USER_ID",property="user",
			one=@One(select="top.dreamyy.hrm.dao.UserDao.selectById",
		fetchType=FetchType.EAGER))
	})
	List<Document> selectByPage(Map<String, Object> params);
	//动态查询数量
	@SelectProvider(type=DocumentDynaSqlProvider.class,method="count")
	Integer count(Map<String, Object> params);
		
	// 动态插入文档
	@SelectProvider(type=DocumentDynaSqlProvider.class,method="insertDocument")
	void save(Document document);
	
	@Select("select * from "+DOCUMENTTABLE+" where ID = #{id}")
	Document selectById(int id);
	
	// 根据id删除文档
	@Delete(" delete from "+DOCUMENTTABLE+" where id = #{id} ")
	void deleteById(Integer id);
		
	// 动态修改文档
	@SelectProvider(type=DocumentDynaSqlProvider.class,method="updateDocument")
	void update(Document document);
		
}
