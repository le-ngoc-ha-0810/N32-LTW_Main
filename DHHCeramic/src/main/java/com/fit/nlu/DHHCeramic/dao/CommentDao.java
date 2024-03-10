package com.fit.nlu.DHHCeramic.dao;


import com.fit.nlu.DHHCeramic.model.Comment;

import java.util.List;

public interface CommentDao {
    void insert(Comment comment);

    void edit(Comment oldComment);

    void delete(int id);

    Comment get(int id);

    List<Comment> getAll();
}
