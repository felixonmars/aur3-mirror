# Maintainer: Luca Contini <jkd.luca@gmail.com>
# Contributor: Lukas Jirkovsky <l DOT jirkovsky AT gmail DOT com>

pkgname=gnome-theme-gilouche
pkgver=11.1.2_13.1
_realver=11.1.2
_pkgver=11.1.2-13.1
pkgrel=1
pkgdesc="Another GNOME theme from openSUSE 11.3"
arch=('any')
url="http://www.opensuse.org/"
license=('GPL')
depends=('gtk-engine-murrine')
makedepends=('rpmextract' 'intltool')
source=(http://download.opensuse.org/repositories/GNOME:/Factory/openSUSE_Factory/src/gtk2-metatheme-gilouche-${_pkgver}.src.rpm)
md5sums=('efbf7281c50e917b9104545a09c92a68')

build() {
  cd "$srcdir"

  rpmextract.sh gtk2-metatheme-gilouche-${_pkgver}.src.rpm
  tar -xf metatheme-gilouche-${_realver}.tar.bz2

  cd metatheme-gilouche-$_realver

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1

}

# vim:set ts=2 sw=2 et:
