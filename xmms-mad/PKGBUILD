# $Id: PKGBUILD,v 1.5 2006/07/20 21:29:48 andyrtr Exp $
# Maintainer: damir <damir@archlinux.org>
# Contributor: forest76 <forestt@poczta.onet.pl>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
pkgname=xmms-mad
pkgver=0.10
pkgrel=2
pkgdesc="Play mpg123 with libmad"
arch=(i686 x86_64)
url="http://xmms-mad.sourceforge.net/"
license=('GPL')
depends=('libid3tag' 'xmms' 'libmad')
groups=('xmms-plugins' 'xmms-io-plugins')
source=(http://dl.sourceforge.net/sourceforge/xmms-mad/$pkgname-$pkgver.tar.gz)

build() {
   cd $startdir/src/$pkgname-$pkgver
   ./configure --prefix=/usr/lib
   make || return 1
   make \
   prefix=$startdir/pkg/usr/lib libdir=$startdir/pkg/usr/lib/xmms/Input \
   install
   find $startdir/pkg -name '*.la' -exec rm {} \;
}

md5sums=('dc806770d2108cae05acbc021b331450')
