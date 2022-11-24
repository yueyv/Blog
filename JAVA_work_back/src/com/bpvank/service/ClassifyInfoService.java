package com.bpvank.service;

import com.bpvank.dao.ClassifyInfoDao;
import com.bpvank.dao.impl.ClassifyInfoDaoImpl;
import com.bpvank.entities.BackstageMenuInfo;
import com.bpvank.entities.ClassifyInfo;
import org.springframework.jdbc.core.BeanPropertyRowMapper;

import java.util.List;

/**
 * 功能说明
 *
 * @author Bpvank
 * @date 2022-07-26 18:48:07
 */
public class ClassifyInfoService {
    ClassifyInfoDao dao = new ClassifyInfoDaoImpl();

    // 查询所有分类
    public List<ClassifyInfo> getAllClassifyInfo() {
        return dao.getAllClassifyInfo();
    }

    // 根据分类id增加文章数量
    public int updateArticleNumber(Integer classifyId) {
        if (classifyId != null) {
            return dao.updateArticleNumber(classifyId);
        }
        return -1;
    }

    // 根据分类id减少文章数量
    public int updateArticleNumber2(Integer classifyId) {
        if (classifyId != null) {
            return dao.updateArticleNumber2(classifyId);
        }
        return -1;
    }

    // 添加分类
    public int insertClassify(ClassifyInfo classifyInfo) {
        if (classifyInfo == null) {
            return -1;
        }
        return dao.insertClassify(classifyInfo);
    }

    // 根据文章id修改分类
    public int updateClassify(ClassifyInfo classifyInfo) {
        if (classifyInfo == null) {
            return -1;
        }
        return dao.updateClassify(classifyInfo);
    }

    // 根据文章id删除分类
    public int deleteClassify(Integer classifyId) {
        if (classifyId != null) {
            return dao.deleteClassify(classifyId);
        }
        return -1;
    }

    // 根据分类id查询分类信息
    public List<ClassifyInfo> getClassifyInfoByClassifyId(Integer classifyId) {
        if(classifyId!=null){
            return dao.getClassifyInfoByClassifyId(classifyId);
        }
        return null;
    }
}