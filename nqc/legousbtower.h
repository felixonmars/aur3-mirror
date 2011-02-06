/*
 * legousbtower Lego USB IR Tower Linux Driver 
 *
 *      Copyright (c) 2001-2002 The LegoUSB DevTeam <legousb-devteam@lists.sourceforge.net>
 * 
 *
 *	This program is free software; you can redistribute it and/or
 *	modify it under the terms of the GNU General Public License as
 *	published by the Free Software Foundation; either version 2 of
 *	the License, or (at your option) any later version.
 *
 */

#ifndef __LEGOUSBTOWER_H
#define __LEGOUSBTOWER_H

#define LEGO_TOWER_SET_PARAM _IOW('u', 0xb0, int)
#define LEGO_TOWER_GET_PARAM _IOW('u', 0xb1, int)
#define LEGO_TOWER_RESET _IO('u', 0xb3)


#define LEGO_TOWER_SET_READ_TIMEOUT _IOW('u', 0xc8, int)
#define LEGO_TOWER_SET_WRITE_TIMEOUT _IOW('u', 0xc9, int)


#define LEGO_USB_TOWER_REQUEST_GET		1
#define LEGO_USB_TOWER_REQUEST_SET		2
#define LEGO_USB_TOWER_REQUEST_RESET		4 


#define LEGO_USB_TOWER_ADDRESS_MODE		1
#define LEGO_USB_TOWER_ADDRESS_POWER_LEVEL	2

#define LEGO_USB_TOWER_POWER_LEVEL_LOW		1
#define LEGO_USB_TOWER_POWER_LEVEL_MEDIUM	2
#define LEGO_USB_TOWER_POWER_LEVEL_HIGH		3

#define LEGO_USB_TOWER_MODE_VLL			1
#define LEGO_USB_TOWER_MODE_RCX			2



struct request_reply
{
	unsigned short length;
	unsigned char  error_code;
	unsigned char  value;
	unsigned char  buffer[16];   // variable replies from the tower
	                   // at this stage we aren't interested in the data
};

#endif
