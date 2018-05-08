package smartlock.common;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Util {

	/**
	 * 비밀번호 암호화
	 * @param value 암호화할 문자열
	 * @return 암호화된 문자열
	 */
	public static String encrypt(String value) {
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(value.getBytes(StandardCharsets.UTF_8));
			return bytesToHex(hash);
		} catch (NoSuchAlgorithmException e) {
			return null;
		}

		//return new String(Base64.encodeBase64(value.getBytes()));
	}

	/**
	 * bytesToHex 메소드에서 사용하는 HexArray
	 */
	private final static char[] hexArray = "0123456789abcdef".toCharArray();

	/**
	 * Byte 를 HexString 으로 변환하는 메소드
	 * @param bytes byte array
	 * @return hex 로 변환된 문자열
	 */
	public static String bytesToHex(byte[] bytes) {
		char[] hexChars = new char[bytes.length * 2];
		for ( int j = 0; j < bytes.length; j++ ) {
			int v = bytes[j] & 0xFF;
			hexChars[j * 2] = hexArray[v >>> 4];
			hexChars[j * 2 + 1] = hexArray[v & 0x0F];
		}
		return new String(hexChars);
	}
}
