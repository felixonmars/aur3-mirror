# $Id: PKGBUILD,v 1.4 2006/07/20 21:29:48 andyrtr Exp $
# Maintainer: damir <damir@archlinux.org>
# Contributor: slackhack
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Snorre Jensen <snojen@gmail.com> 
pkgname=xmms-eq
_origname=eq-xmms
pkgver=0.7
_skinsver=0.2
pkgrel=2
pkgdesc="a realtime graphical equalizer effect plugin that will equalize almost everything that you play through XMMS (inclusive skins)"
arch=(i686 x86_64)
options=('!libtool')
url="http://equ.sourceforge.net/"
license=('GPL')
depends=('xmms')
groups=('xmms-plugins' 'xmms-effect-plugins')
source=("http://downloads.sourceforge.net/equ/$_origname-src/$pkgver/$_origname-$pkgver.tar.gz" \
        "http://downloads.sourceforge.net/equ/$_origname-skins/$_skinsver/$_origname-skins-$_skinsver.tar.bz2")
build() {
    # the effect plugin:
    cd $startdir/src/$_origname-$pkgver
    ./configure  \
        --prefix=/usr/lib \
        --disable-autodetect # we are building for all i686
    make || return 1
    make \
       prefix=$startdir/pkg/usr/lib \
       libdir=$startdir/pkg/usr/lib/xmms/Effect \
       install

    # skins:
    mkdir -p $startdir/pkg/usr/lib/xmms/EQskins
    install -c -m 644 $startdir/src/EQskins/*.tgz $startdir/pkg/usr/lib/xmms/EQskins
}

md5sums=('a211f894906696c5bb1cfa65f57e8155'
         'a75bc27527df7887bd9dc4d8715afdcd')
