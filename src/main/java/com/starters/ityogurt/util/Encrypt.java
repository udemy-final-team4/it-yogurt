package com.starters.ityogurt.util;

import java.nio.charset.StandardCharsets;
import java.util.Base64;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

//    public static void main(String[] args) {
//        try {
//            Encrypt e = new Encrypt();
//            String s1 = "1";
//
//            System.out.println("암호화 :" +  e.encryptAES256(s1));
//            String s2 = e.encryptAES256(s1);
//            System.out.println("복호화 :" +  e.decryptAES256(s2));
//
//        } catch (Exception ex) {
//           ex.printStackTrace();
//        }
//    }
//}

public class Encrypt {

    /*    public static String alg = "AES/CBC/PKCS5Padding";
        private final String key = "xLEXKpMHGBbUSBC4bz5q5cBTWAVSniSv"; // 32byte
        private String iv = "ro5GIEFIrEKAiwDC";*/

    public static String alg = "AES/CBC/PKCS5Padding";
    private final String key = "abcdefghabcdefghabcdefghabcdefgh"; // 32byte
    private String iv = "0123456789abcdef"; // 16byte

    // 암호화
    public String encryptAES256(String text) throws Exception {
        Cipher cipher = Cipher.getInstance(alg);
        SecretKeySpec keySpec = new SecretKeySpec(key.getBytes(), "AES");

        IvParameterSpec ivParamSpec = new IvParameterSpec(iv.getBytes());
        cipher.init(Cipher.ENCRYPT_MODE, keySpec, ivParamSpec);

        byte[] encrypted = cipher.doFinal(text.getBytes(StandardCharsets.UTF_8));
        return Base64.getEncoder().encodeToString(encrypted);
    }

    // 복호화
    public String decryptAES256(String cipherText) throws Exception {
        Cipher cipher = Cipher.getInstance(alg);
        SecretKeySpec keySpec = new SecretKeySpec(key.getBytes(), "AES");
        IvParameterSpec ivParamSpec = new IvParameterSpec(iv.getBytes());
        cipher.init(Cipher.DECRYPT_MODE, keySpec, ivParamSpec);

        byte[] decodedBytes = Base64.getDecoder().decode(cipherText);
        byte[] decrypted = cipher.doFinal(decodedBytes);
        return new String(decrypted, StandardCharsets.UTF_8);
    }
}