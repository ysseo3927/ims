package com.kt.ims.service;

import org.springframework.stereotype.Service;

@Service
public class MainService {

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
