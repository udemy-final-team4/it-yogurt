package com.starters.ityogurt.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {

    public long diffOfDate(String begin, String end) throws Exception {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        Date beginDate = format.parse(begin);
        Date endDate = format.parse(end);

        long diff = endDate.getTime() - beginDate.getTime();
        long diffDays = diff / (24 * 60 * 60 * 1000);

        return diffDays;
    }

    public String afterOneDay(String lastLoginDate, int addDay) throws Exception {
        SimpleDateFormat sdf  = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = sdf.parse(lastLoginDate);

        Calendar cal = Calendar.getInstance();
        cal.setTime(date);

        cal.add(Calendar.DATE, addDay);
        String resultDate = sdf.format(cal.getTime());
        return resultDate;
    }

    public String ConvertDateFormat(Date date) throws Exception {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return format.format(date);
    }
}
