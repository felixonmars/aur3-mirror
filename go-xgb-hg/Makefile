# Copyright 2009 The XGB Authors. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

include $(GOROOT)/src/Make.inc

TARG=x-go-binding.googlecode.com/hg/xgb
GOFILES=\
	auth.go\
	xgb.go\
	xproto.go\

include $(GOROOT)/src/Make.pkg

xproto.go:
	python2 go_client.py -p /usr/share/xcb/ /usr/share/xcb/xproto.xml
	gofmt -w xproto.go

