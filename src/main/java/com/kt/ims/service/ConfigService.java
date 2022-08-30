package com.kt.ims.service;

import com.kt.ims.domain.ImsMember;
import com.kt.ims.repository.ImsMemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

@Service
public class ConfigService {

    @Autowired
    ImsMemberRepository imsMemberRepository;

    public List<ImsMember> getMemberDatas(String memberId, String nickname, String email){
        List<ImsMember> memberDatas = imsMemberRepository.findMemberDatas(memberId, nickname, email);
        return memberDatas;
    }

    public ImsMember updateMemberPassword(String rowId, String password){

        ImsMember imsMember = imsMemberRepository.findById(Long.valueOf(rowId)).orElseThrow();

        String encodePassword = imsMemberRepository.findByPasswordEncode(password);
        imsMember.setMemberPw(encodePassword);
        ImsMember savedImsMember = imsMemberRepository.save(imsMember);

        return savedImsMember;
    }

    public ImsMember signout(String rowId){

        ImsMember imsMember = imsMemberRepository.findById(Long.valueOf(rowId)).orElseThrow();

        imsMember.setLeaveDate(LocalDateTime.now());
        ImsMember savedImsMember = imsMemberRepository.save(imsMember);

        return savedImsMember;
    }

    public boolean checkId(String joinId){

        Optional<ImsMember> imsMember = imsMemberRepository.findByMemberId(joinId);
        if(imsMember.isEmpty()){
            return false;
        }else{
            return true;
        }
    }

    public boolean join(String joinId,String joinPassword, String joinNickname, String joinEmail){

        String encodePassword = imsMemberRepository.findByPasswordEncode(joinPassword);

        ImsMember imsMember = ImsMember.builder()
                .memberId(joinId)
                .memberPw(encodePassword)
                .nickname(joinNickname)
                .email(joinEmail)
                .joinDate(LocalDateTime.now())
                .visitDate(LocalDateTime.now())
                .etc("일반유저")
                .regdate(LocalDateTime.now())
                .build();

        imsMemberRepository.save(imsMember);

        return true;
    }




}
