package com.xiaoxiao.hospital.utils;

import java.io.*;

/** 
 * MySQL数据库备份 
 *  
 */  
public class MySQLDatabaseBackup {  
  
    /** 
     * Java代码实现MySQL数据库导出 
     *  
     * @param hostIP MySQL数据库所在服务器地址IP 
     * @param userName 进入数据库所需要的用户名 
     * @param password 进入数据库所需要的密码 
     * @param savePath 数据库导出文件保存路径 
     * @param fileName 数据库导出文件文件名 
     * @param databaseName 要导出的数据库名 
     * @return 返回true表示导出成功，否则返回false。 
     */  
    public static boolean exportDatabaseTool(String hostIP, String userName, String password, String savePath, String fileName, String databaseName) throws InterruptedException {  
        File saveFile = new File(savePath);  
        if (!saveFile.exists()) {// 如果目录不存在  
            saveFile.mkdirs();// 创建文件夹  
        }  
        
        //判断保存路径后缀结束是否为默认系统分隔符，
        if(!savePath.endsWith(File.separator)){ //如果没有 
            savePath = savePath + File.separator;  //加上
        }  
        //输入字符流
        PrintWriter printWriter = null;
        //缓冲字符流
        BufferedReader bufferedReader = null;  
        try {  
        	//输入字符流与目的文件进行绑定
            printWriter = new PrintWriter(new OutputStreamWriter(new FileOutputStream(savePath + fileName), "utf8")); 
            //每个 Java 应用程序都有一个 Runtime 类实例，使应用程序能够与其运行的环境相连接。可以通过 getRuntime 方法获取当前运行时。 
            //Runtime.exec在单独的进程中执行指定的字符串命令。
            //使MySQL执行数据库备份语句
            Process process = Runtime.getRuntime().exec(" mysqldump -h" + hostIP + " -u" + userName + " -p" + password + " --set-charset=UTF8 " + databaseName);  
            //创建输出字符流读取process执行指令后所输出的内容，并设置制定编码
            InputStreamReader inputStreamReader = new InputStreamReader(process.getInputStream(), "utf8");
            //对输出字符流进行缓冲
            bufferedReader = new BufferedReader(inputStreamReader);
            //读取缓冲字符流中的内容，每次一行
            String line;  
            while((line = bufferedReader.readLine())!= null){ 
            	//读取后将其写入目的文件
                printWriter.println(line);  
            }
            //刷新输入字符流的缓冲
            printWriter.flush();  
            if(process.waitFor() == 0){//0 表示线程正常终止。  
                return true;  
            }  
        }catch (IOException e) {  
            e.printStackTrace();  
        } finally {  
        	//释放资源
            try {  
                if (bufferedReader != null) {  
                    bufferedReader.close();  
                }  
                if (printWriter != null) {  
                    printWriter.close();  
                }  
            } catch (IOException e) {  
                e.printStackTrace();  
            }  
        }  
        //表示process线程非正常终止
        return false;  
    }  
}  
