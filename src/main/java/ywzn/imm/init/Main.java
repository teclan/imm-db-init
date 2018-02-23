package ywzn.imm.init;

import java.io.Console;

import ywzn.imm.init.handle.DefaultHandle;
import ywzn.imm.init.handle.handle;

public class Main {

	public static void main(String[] args) {

		handle handle = new DefaultHandle();

		handle.handle();

		Console cs = System.console();

		if (cs == null) {
			return;
		}
		System.out.println("\n\n按任意键退出....");

		while (cs.readLine() != null) {
			System.exit(0);
		}
	}
}
