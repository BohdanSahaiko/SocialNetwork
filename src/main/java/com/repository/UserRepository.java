package com.repository;

import com.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by bohdan on 15.09.16.
 */

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
        @Query("select a from User a  where a.username = :username")
        User findByUserName(@Param("username") String username);
        @Query("select b from User b  where b.id = :id")
        User getUser(@Param("id") Long id);
        @Query("select c from User c  where c.name LIKE CONCAT('%',:place,'%') or c.surname LIKE CONCAT('%',:place,'%') ")
        List<User> findUsers(@Param("place")String place);
}
