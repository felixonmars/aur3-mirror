# $Id: PKGBUILD,v 1.4 2006/06/02 18:59:12 ganja_guru Exp $
# Maintainer: damir <damir@archlinux.org>

pkgname=libvisual-xmms
provides=('xmms-libvisual')
pkgver=0.2.0
pkgrel=2
pkgdesc="xmms plugin for libvisual"
arch=(i686 x86_64)
url="http://libvisual.sourceforge.net/v2/"
depends=('xmms' 'libvisual' 'libvisual-plugins' 'sdl')
groups=('xmms-plugins' 'xmms-visualization-plugins')
source=(http://dl.sourceforge.net/sourceforge/libvisual/libvisual-xmms-$pkgver.tar.gz)
#source=(http://dl.sourceforge.net/sourceforge/libvisual/$pkgname-$pkgver.tar.gz)

build()
{
   cd $startdir/src/$pkgname-$pkgver
        ./configure --prefix=/usr
        make || return 1
        make DESTDIR=$startdir/pkg install
}
md5sums=('5de44496a3df0421a709fdde5aca6e86')
md5sums=('5de44496a3df0421a709fdde5aca6e86')
md5sums=('5de44496a3df0421a709fdde5aca6e86')
