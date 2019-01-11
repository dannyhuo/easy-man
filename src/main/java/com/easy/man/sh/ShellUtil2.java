package com.easy.man.sh;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;

public class ShellUtil2 {

    private final static String BLANK = " ";
    private static String remoteShellPath2 = "/Users/danny/works/idea/easy-man/bin/sh/remote-shell2.sh";
    public static List<String> exec(String command, String host, String user){
        List<String> result = null;
        Process proc = null;
        StringBuffer rmtCmd = new StringBuffer("sh ");
        try {
            rmtCmd.append(remoteShellPath2);
            rmtCmd.append(BLANK);
            rmtCmd.append(user);
            rmtCmd.append(BLANK);
            rmtCmd.append(host);
            rmtCmd.append(BLANK);
            rmtCmd.append(command);
            proc = Runtime.getRuntime().exec(rmtCmd.toString());
            result = ShellUtil.getProcessResult(proc, command);
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

    public static void main(String[] args) {
        System.out.println(exec("ls -al /","cdp","az-user"));
    }
}
