# $Id: PKGBUILD 77290 2010-04-11 20:17:06Z thayer $
# Maintainer: Thayer Williams <thayer@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>

pkgname=dmenu-history
_pkgbasename=dmenu
pkgver=4.5
pkgrel=1
pkgdesc="Dynamic X menu. Patched with history support"
url="http://www.suckless.org/programs/dmenu.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('libx11' 'libxinerama')
provides=('dmenu')
conflicts=('dmenu')
makedepends=('xineramaproto')
source=(http://dl.suckless.org/tools/$_pkgbasename-$pkgver.tar.gz 
	dmenu-4.5-history.diff)
md5sums=('9c46169ed703732ec52ed946c27d84b4'
         'a6f74b14edcccd4a8525d9c1f281d041')


build()
{
  cd $srcdir/$_pkgbasename-$pkgver
  patch -p1 < ../dmenu-4.5-history.diff || return 1

#cd $_pkgbasename-$pkgver
  ls
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 || return 1
  echo 'compiled'
  make PREFIX=/usr DESTDIR=$pkgdir install || return 1

  #install license
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

