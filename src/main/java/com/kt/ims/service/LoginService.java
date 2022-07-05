package com.kt.ims.service;

import com.kt.ims.domain.ImsMember;
import com.kt.ims.repository.ImsMemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class LoginService {

    @Autowired
    ImsMemberRepository imsMemberRepository;


    public ImsMember getMember(String memberId, String memberPw){

        Optional<ImsMember> oMember = imsMemberRepository.findByMemberId(memberId);

        if (oMember.isPresent()){
            ImsMember member = oMember.get();
            String passwordVal = member.getMemberPw();
            String convertPassword = imsMemberRepository.findByPasswordEncode(memberPw);
            if(passwordVal.equals(convertPassword)){
                return member;
            }else{
                return null;
            }
        }else{
            return null;
        }

    }
}
