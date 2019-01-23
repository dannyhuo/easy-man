package com.easy.man.sh;

import com.easy.man.config.CustomerConfig;
import org.springframework.beans.factory.annotation.Value;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class ShellUtil {


    public static List<String> exec(String command){
        List<String> result = null;
        Process proc = null;
        try {
            proc = Runtime.getRuntime().exec(command);

            result = getProcessResult(proc, command);
        } catch (IOException e) {
            e.printStackTrace();
            result.add(e.getMessage());
        } finally {
            if (null != proc) {
                proc.destroy();
            }
        }
        return result;
    }


    public static List<String> getProcessResult (Process proc, String command) {
        InputStream in = null;
        InputStreamReader read = null;
        BufferedReader reader = null;
        List result = new ArrayList();
        try {
            in = proc.getInputStream();
            read = new InputStreamReader(in);
            reader = new BufferedReader(read);
            int status = proc.waitFor();
            if (status != 0) {
                result.add("Failed to call shell's command : " + command);
            }
            String line;
            while ((line = reader.readLine())!= null) {
                result.add(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } finally {
            if (null != reader) {
                try {
                    reader.close();
                    read.close();
                    in.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return result;
    }

    @Value("${easy.man.bin}")
    private static String bin = "/home/az-user/work/monitor/easy-man-0.0.1-SNAPSHOT/bin";
    private static String remoteShellPath =  "sh " + bin + "os/remote-shell.sh";
    private final static String BLANK = " ";
    public static List<String> exec(String command, String host, String user){
        List<String> result = null;
        Process proc = null;
        StringBuffer rmtCmd = new StringBuffer();
        try {
            rmtCmd.append(remoteShellPath);
            rmtCmd.append(BLANK);
            rmtCmd.append("-user");
            rmtCmd.append(BLANK);
            rmtCmd.append(user);
            rmtCmd.append(BLANK);
            rmtCmd.append("-host");
            rmtCmd.append(BLANK);
            rmtCmd.append(host);
            rmtCmd.append(BLANK);
            rmtCmd.append("-cmd");
            rmtCmd.append(BLANK);
            rmtCmd.append(command);
            System.out.println(rmtCmd);
            proc = Runtime.getRuntime().exec(rmtCmd.toString());
            result = getProcessResult(proc, command);
        } catch (IOException e) {
            e.printStackTrace();
            result.add(e.getMessage());
        } finally {
            if (null != proc) {
                proc.destroy();
            }
        }

        return result;
    }


    /**
     * 将字符串中的空多空格替换单空格
     * @param str
     * @return
     */
    public static String pickBlank (String str) {
        int len = str.length();
        StringBuffer buffer = new StringBuffer();

        int flag = 1;
        for (int i = 0; i < len; i++) {

            char cur = str.charAt(i);

            //当遇到第一个空格，拼入字符串
            if (cur == ' ' && flag < 1) {
                buffer.append(BLANK);
                flag ++;
            }

            //遇到非空格，拼入字符串
            if (cur != ' ') {
                buffer.append(cur);
                flag = 0;

            }
        }

        return buffer.toString();
    }

    public static String[] pickArray (String str) {
        return pickBlank(str).split(BLANK);
    }

    public static void main(String[] args) {

        //System.out.println(exec("ssh zk3 ls","cdp","az-user"));

        System.out.println(pickBlank(exec("free","cdp","az-user").get(0)));
    }
}
