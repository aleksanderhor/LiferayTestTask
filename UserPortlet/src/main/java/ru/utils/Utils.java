package ru.utils;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

public final class Utils {

    private static final DateFormat df = DateFormat.getDateInstance(DateFormat.FULL, Locale.forLanguageTag("ru"));

    public static String getDateToTextLocale(Date date) {
        return df.format(date);
    }
}
