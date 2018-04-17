package com.platform.tools;

import java.io.IOException;
import java.util.Map;

import com.platform.tools.PositionUtil;
import org.json.JSONException;

/**
 * Created by 998 on 2018/4/16.
 */
public class PositionTest {
        public static void main(String[] args) throws IOException, JSONException {
            //这里调用百度的ip定位api服务 详见 http://api.map.baidu.com/lbsapi/cloud/ip-location-api.htm
            //JSONObject json = readJsonFromUrl("http://api.map.baidu.com/location/ip?ak=F454f8a5efe5e577997931cc01de3974&ip=202.198.16.3");
            //System.out.println(json.toString());
            //System.out.println(((JSONObject) json.get("content")).get("address"));

            Map<String,Double> map= PositionUtil.getLngAndLat("上海市中春路明谷科技园");
            System.out.println("经度："+map.get("lng")+"---纬度："+map.get("lat"));
        }
}
