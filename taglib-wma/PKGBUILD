# $Id: PKGBUILD,v 1.9 2005/08/27 10:56:42 tpowa Exp $
# Maintainer: Storyteller <spiralsorrow@hotmail.com>

pkgname=taglib-wma
_origname=taglib
provides=('taglib')
conflicts=('taglib')
pkgver=1.4
_origver=1.4
pkgrel=2
pkgdesc="A library for reading and editing the meta-data of several popular audio formats patched to include wma support."
url="http://www.cs.berkeley.edu/~ushankar/taglib-wma/"
depends=()
source=(http://www.cs.berkeley.edu/%7Eushankar/taglib-wma/taglib-wmapatched-1.4.tar.gz)
md5sums=('66318855ace24762d9828f0b1e959654')

build() {
     cd $startdir/src/$_origname-$_origver
     ./configure --prefix=/usr
#change makefile to point to proper location for install
     sed -i "s~/usr/bin/install~/bin/install~"  $startdir/src/taglib-1.4/taglib/wma/Makefile
     make || return 1
     make prefix=$startdir/pkg/ install
}