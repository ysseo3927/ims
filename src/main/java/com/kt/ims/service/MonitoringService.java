package com.kt.ims.service;

import org.springframework.stereotype.Service;

@Service
public class MonitoringService {


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

    public String genLine(){
        int randomIntValue = (int)(Math.random() * (8 - 1 + 1)) + 1;

        return randomIntValue + "호선";
    }

    public String genCar(){
        int randomIntValue = (int)(Math.random() * (371000 - 311000 + 1)) + 311000;

        return randomIntValue+"";
    }

    public String genPscar(){
        int randomIntValue = (int)(Math.random() * (3900 - 3100 + 1)) + 3100;

        return randomIntValue+"";
    }
    public String genImei(){
        long randomLongValue = (long)(Math.random() * (398645070008321L - 308645070008321L + 1)) + 308645070008321L;

        return randomLongValue+"";
    }
    public String genLte(){
        int pre = (int)(Math.random() * (9999 - 1000 + 1)) + 1000;
        int sur = (int)(Math.random() * (9999 - 1000 + 1)) + 1000;

        return "010-"+pre+"-"+sur;
    }

    public String getIonm(){
        int randomIntValue = (int)(Math.random() * (10 - 1 + 1)) + 1;

        return randomIntValue+"";
    }

    public String getIons(){
        int randomIntValue = (int)(Math.random() * (10 - 1 + 1)) + 1;

        return randomIntValue+"";
    }

    public String genSystemStatus(){
        int randomIntValue = (int)(Math.random() * (2 - 1 + 1)) + 1;

        String status = "";
        if(randomIntValue < 2){
            status = "ON";
        }else{
            status = "OFF";
        }
        return status;
    }

    public String genIonStatus(){
        int randomIntValue = (int)(Math.random() * (2 - 1 + 1)) + 1;

        String status = "";
        if(randomIntValue < 2){
            status = "ON";
        }else{
            status = "OFF";
        }
        return status;
    }
}
