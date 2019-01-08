package com.easy.man.sh;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class ShellUtil {

    public static String exec(String command){
        String result = null;
        Process proc = null;
        try {
            proc = Runtime.getRuntime().exec(command);

            result = getProcessResult(proc, command);
        } catch (IOException e) {
            e.printStackTrace();
            result = e.getMessage();
        } finally {
            if (null != proc) {
                proc.destroy();
            }
        }
        return result;
    }


    public static String getProcessResult (Process proc, String command) {
        InputStream in = null;
        InputStreamReader read = null;
        BufferedReader reader = null;
        StringBuffer result = new StringBuffer();
        try {
            in = proc.getInputStream();
            read = new InputStreamReader(in);
            reader = new BufferedReader(read);
            int status = proc.waitFor();
            if (status != 0) {
                result.append("Failed to call shell's command : " + command);
            }
            String line;
            while ((line = reader.readLine())!= null) {
                result.append(line).append("\n");
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

        return result.toString();
    }

    private static String remoteShellPath = "/Users/danny/works/idea/easy-man/bin/sh/remote-shell.sh";
    private final static String BLANK = " ";
    public static String exec(String command, String host, String user){
        String result = null;
        Process proc = null;
        StringBuffer rmtCmd = new StringBuffer("sh ");
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
            result = e.getMessage();
        } finally {
            if (null != proc) {
                proc.destroy();
            }
        }

        return result;
    }


    public static void main(String[] args) {
        System.out.println(exec("ssh zk3 ls","cdp","az-user"));
    }
}
