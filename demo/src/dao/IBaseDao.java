package dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

/**
 * 持久层操作接口
 */
public interface IBaseDao<T> {
    //   根据属性查找所有
    List<T> findByProp(HashMap<String, Object> prop) throws SQLException;

    //   增加
    int insert(T t);

    //   修改
    int update(T t);

    //   删除
    int delete(int id);
}