package com.kt.ims.service;

import com.kt.ims.repository.ImsDataRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class MainService {

    @Autowired
    ImsDataRepository imsDataRepository;

    //-- 전노선 평균 통합 공기질 지수
    public double getAllLineAvgIaq(Integer hour){
        double allLineAvgIaq = imsDataRepository.findByAllLineAvgIaq(hour);
        System.out.println(allLineAvgIaq);
        return allLineAvgIaq;
    }

    public List<HashMap<String,Object>> getTimeTableAllLineAvgIaq(){
        List<HashMap<String,Object>> timeTableAllLineAvgIaqs = imsDataRepository.findTimeTableAllLineAvgIaq();
        return timeTableAllLineAvgIaqs;
    }

    public List<HashMap<String,Object>> getAllLineAvgData(Integer hour){
        List<HashMap<String,Object>> getAllLineAvgDatas = imsDataRepository.findAllLineAvgData(hour);
        return getAllLineAvgDatas;
    }

    public double genIaq(){
        return (double)Math.round(((Math.random() *( 300 - 50 + 1)) + 50) * 100) / 100.0;
    }

    public double genGp10(){
        return (double)Math.round(((Math.random() *( 100 - 10 + 1)) + 10) * 100) / 100.0;
    }

    public double genGp1_0(){
        return (double)Math.round(((Math.random() *( 100 - 10 + 1)) + 10) * 100) / 100.0;
    }

    public double genGp2_5(){
        return (double)Math.round(((Math.random() *( 100 - 10 + 1)) + 10) * 100) / 100.0;
    }

    public double genTvoc(){
        return (double)Math.round(((Math.random() *( 100 - 10 + 1)) + 10) * 100) / 100.0;
    }

    public double genCo2(){
        return (double)Math.round(((Math.random() *( 700 - 300 + 1)) + 300) * 100) / 100.0;
    }

    public double genTemp(){
        return (double)Math.round(((Math.random() *( 3500 - 2300 + 1)) + 2300)) / 100.0;
    }

    public double genHumi(){
        return (double)Math.round(((Math.random() *( 8000 - 4000 + 1)) + 4000)) / 100.0;
    }

}
