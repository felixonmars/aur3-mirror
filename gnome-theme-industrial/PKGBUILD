# Maintainer: Luca Contini <jkd.luca@gmail.com>
# Contributor: Lukas Jirkovsky <l DOT jirkovsky AT gmail DOT com>

pkgname=gnome-theme-industrial
pkgver=0.6.5_100.2
_realver=0.6.5
_pkgver=0.6.5-100.2
pkgrel=1
pkgdesc="Another GNOME theme from openSUSE 11.3"
arch=('any')
url="http://www.opensuse.org/"
license=('GPL')
depends=('gtk-engine-murrine')
makedepends=('rpmextract')
source=(http://download.opensuse.org/repositories/GNOME:/Factory/openSUSE_Factory/src/gtk2-metatheme-industrial-${_pkgver}.src.rpm)
md5sums=('d8c0da436aa31e63c23aec4376fc6a4d')

build() {
  cd "$srcdir"

  rpmextract.sh gtk2-metatheme-industrial-${_pkgver}.src.rpm
  tar -xf metatheme-industrial-${_realver}.tar.bz2

  cd metatheme-industrial-$_realver

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1

}

# vim:set ts=2 sw=2 et:
