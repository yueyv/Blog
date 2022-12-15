package com.java_work.dao;

import com.java_work.entities.Message;

import java.util.List;

/**
 * @author 刘辉 王子荀 鲁哲豪
 */
public interface MessageDao {
    // 添加留言
    int insertMessage(Message message);

    // 查询所有留言  进行分页
    int findTotalCount();

    List<Message> findByPage(int start, int rows);

    // 根据留言id 删除留言
    int deleteMessage(Integer messageId);

    // 根据留言id 回复留言  更新留言
    int updateMessageReply(Integer messageId, String replyContent);
}
