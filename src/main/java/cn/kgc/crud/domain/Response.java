package cn.kgc.crud.domain;





import java.util.HashMap;
import java.util.Map;

/**
 * @program: ssm-crud->Resoponse
 * @description: 统一响应实体
 * @author: 林鑫哲
 * @create: 2019-11-27 21:12
 **/
public class Response {
    private int code;//返回编码  100响应成功 700响应失败 数字可以自定义
    private String message; //返回信息是响应成功失败
    private Map<String,Object> extend= new HashMap<>();//前端传来的数据

    public static Response success(){
        Response result = new Response();
        result.setCode(100);
        result.setMessage("执行成功");
        return result;
    }
    public static Response fail(){
        Response result = new Response();
        result.setCode(700);
        result.setMessage("执行失败");
        return result;
    }
    //将pageinfo 传到map赋值来进行返回给视图
    public Response add(String key, Object value){
            this.getExtend().put(key, value);
            return this;
    }
    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
