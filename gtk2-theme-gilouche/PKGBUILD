# Maintainer: Dylan Lainhart <dlainhart@gmail.com>
# Contributor: Dylan Lainhart <dlainhart@gmail.com>
# Thanks to: Link Dupont <link.dupont@gmail.com>

pkgname=gtk2-theme-gilouche
pkgver=11.1.2_28.3
pkgrel=1
pkgdesc="openSUSE themes and metathemes for gtk2 and metacity"
arch=('any')
url="http://www.opensuse.org/"
license=('GPL')
depends=('tango-icon-theme')
makedepends=('rpmextract' 'intltool')
source=(http://download.opensuse.org/repositories/GNOME:/Factory/openSUSE_Factory/src/gtk2-metatheme-gilouche-${pkgver//_/-}.src.rpm)
md5sums=('126845416cf2a39589af768ea88e1aa7')

build() {
  cd "$srcdir"

  rpmextract.sh gtk2-metatheme-gilouche-${pkgver//_/-}.src.rpm
  tar -xf metatheme-gilouche-${pkgver%_*}.tar.bz2
  tar -xf metacity-theme-greygilouche.tar.bz2
  tar -xf metatheme-synchronicity.tar.bz2

  cd metatheme-gilouche-${pkgver%_*}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir/ install

  cp -r ../GreyGilouche $pkgdir/usr/share/themes
  cp -r ../Synchronicity $pkgdir/usr/share/themes
}

# vim:set ts=2 sw=2 et:
