# $Id: PKGBUILD 19886 2010-06-30 12:23:50Z daenyth $
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Jo Christian Bergskås <jcberg@gmail.com>

pkgname=fceux-nogui
pkgver=2.1.4a
pkgrel=2
arch=('i686' 'x86_64')
url="http://fceux.com/web/home.html"
pkgdesc="A fast and ultra-compatible NES/Famicom emulator with SDL, OpenGL and SVGALIB support"
license=('GPL')
depends=('sdl' 'zenity' 'lua' 'gtk2')
makedepends=('scons' 'mesa')
optdepends=('xchm: for viewing the help manual')
conflicts=('fceux')
provides=('fceux' 'fceu' 'gfceux')
replaces=('fceu' 'gfceux')
source=(http://downloads.sourceforge.net/fceultra/fceux-${pkgver}.src.tar.bz2)
md5sums=('a1252a888cdc8b2c42ae031211f2fad6')

build() {

  cd "${srcdir}/fceu$pkgver"
  sed -i "s|Enable GTK2 GUI (SDL only)', 1|Enable GTK2 GUI (SDL only)', 0|" SConstruct || return 1
  sed -i "s|'Enable GTK2 for dialogs only', 0|'Enable GTK2 for dialogs only', 1|" SConstruct || return 1
  scons || return 1

  sed -i "s|/usr/local|${pkgdir}/usr|" SConstruct || return 1
  scons install || return 1
  install -D -m644 bin/fceux.chm "${pkgdir}/usr/share/doc/$pkgname/fceux.chm" || return 1

}

# vim:set ts=2 sw=2 et:
