package tools;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class DateTime {

    public static String Convert(int time) {
        // Calendar 객체 생성
        Calendar cal = Calendar.getInstance();
        // 현재 시간 + 인자
        cal.add(Calendar.HOUR, time);

        // 출력 형태 지정
        SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");


        String dateTime = date.format(cal.getTime());
        return dateTime;
    }

}