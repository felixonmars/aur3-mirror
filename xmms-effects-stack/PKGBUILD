# $Id: PKGBUILD,v 1.3 2006/09/07 20:43:45 andyrtr Exp $
# Maintainer: damir <damir@archlinux.org>
# Contributor: forest76 <forestt@poczta.onet.pl>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
pkgname=xmms-effects-stack
pkgver=0.0.3
pkgrel=3
pkgdesc="Allow xmms to use multiply effect plugins"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/efxmms"
license=('GPL')
depends=('glibc' 'xmms')
groups=('xmms-plugins' 'xmms-effect-plugins')
source=(http://dl.sourceforge.net/sourceforge/efxmms/EFXmms-$pkgver.tar.bz2)
md5sums=('33be37eac15b33d9d278064c0daef7cc')

build() {
    cd $startdir/src/EFXmms-$pkgver
    # arch64 fix --host=i686-gnu-linux
    ./configure --prefix=/usr/lib --host=i686-gnu-linux
    make || return 1
    make \
       prefix=$startdir/pkg/usr/lib \
       libdir=$startdir/pkg/usr/lib/xmms/Effect \
       install
    find $startdir/pkg -name '*.la' -exec rm {} \;
}
