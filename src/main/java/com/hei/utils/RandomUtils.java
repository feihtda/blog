package com.hei.utils;

import java.util.Random;
import java.util.stream.IntStream;

public class RandomUtils {


    public static int new1to100000(){
        Random random=new Random();
        return random.nextInt(100000);
    }
}
