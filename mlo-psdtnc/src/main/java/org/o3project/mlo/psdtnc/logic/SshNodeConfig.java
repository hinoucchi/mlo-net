/**
 * AccNodeConfig.java
 * (C) 2014,2015, Hitachi, Ltd.
 */
package org.o3project.mlo.psdtnc.logic;

/**
 * AccNodeConfig
 *
 */
public interface SshNodeConfig {

	/**
	 * @return
	 */
	String getHost();

	/**
	 * @return
	 */
	int getSshPort();

	/**
	 * @return
	 */
	String getUserid();

	/**
	 * @return
	 */
	String getPassword();

	/**
	 * @return
	 */
	int getSshSessionTimeout();

	/**
	 * @return
	 */
	int getSshChannelTimeout();

}
