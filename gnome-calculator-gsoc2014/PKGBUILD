# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=gnome-calculator-gsoc2014
_realname=gnome-calculator
pkgver=3.14.1
pkgrel=1
pkgdesc='The GNOME Calculator - Applied patches to History view, Keyboard mode, and buttons tweaks'
arch=('i686' 'x86_64')
license=('GPL')
provides=('gnome-calculator')
conflicts=('gcalctool' 'gnome-calculator')
depends=('dconf' 'gtk3' 'gtksourceview3')
makedepends=('automake' 'gconf' 'git' 'gnome-common' 'intltool' 'itstool' 'libarchive' 'pkg-config' 'vala' 'yelp-tools')
url="https://github.com/elitalobo/GSOC2014"
groups=('gnome')
install=gnome-calculator-gsoc2014.install
source=("http://ftp.gnome.org/pub/gnome/sources/$_realname/${pkgver:0:4}/$_realname-$pkgver.tar.xz"
        '0001-adds-padding-to-buttons.patch'
        '0001-Adds-color-to-buttons.patch'
        '0001-Implements-History-View.patch'
        '0001-Implements-Keyboard-mode.patch'
        'Documentation.patch')
sha256sums=('99cb2451d67d51486c0f54497dd26c0e57d0d984866ddf8678a62ba195fed140'
            'a6fe2ada763446f2957dfd1aa704d36554562ddef494483d91a07a4cfe731f7b'
            'c7324de6bc7aeb3788e3d52e6dce7e0b8e213446a2b511ce428558e6251b600d'
            'cdad1cdbde544d2d04652a5f045d460a003f5dc3c36795e0225299eb7be3ec58'
            '9998134c59ce8600908059b36ece76ec601b5243b7f7ee9cea3dfde9938f2741'
            '0e9129c1262288a49b7a9329c1b7e230caf6826837223d907525b3f841fde704')

prepare() {
  rm -rf "$srcdir/$_realname-$pkgver"
  bsdtar -xf "$startdir/$_realname-$pkgver.tar.xz"
  cd "$srcdir/$_realname-$pkgver"
  for patch in "${source[@]:1}"; do
    git apply -p1 --whitespace=fix ../$patch 
  done
}

build() {
  cd "$srcdir/$_realname-$pkgver"
  ./autogen.sh
  make
}

check() {
  cd "$srcdir/$_realname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$_realname-$pkgver"
  make DESTDIR="$pkgdir" install
}
