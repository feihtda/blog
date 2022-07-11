package com.hei.utils;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class Message {
    private static int msgcode;
    private static String msg;
    private Map<String,Object> map=new HashMap<>();

    public int getMsgcode() {
        return msgcode;
    }

    public void setMsgcode(int msgcode) {
        this.msgcode = msgcode;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }
    public static Message success(){
        Message message=new Message();
        message.setMsg("成功");
        message.setMsgcode(11);
        return message;
    }
    public static Message error(){
        Message message=new Message();
        message.setMsg("失败");
        message.setMsgcode(11);
        return message;
    }
    public Message addMap(String s, Object o){
        this.map.put(s,o);
        return this;
    }
}
