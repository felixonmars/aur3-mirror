# Maintainer: Antony Ho <ntonyworkshop@gmail.com>
pkgname=ibus-cangjie
pkgver=2.3
pkgrel=1
pkgdesc="This is an IBus engine for users of the Cangjie and Quick input methods."
arch=('x86_64' 'i686')
url="http://cangjians.github.io/projects/ibus-cangjie/"
license=('GPL3')
depends=('ibus>=1.4.1' 'pycangjie>=1.0' 'python>=3.2' 'python-gobject')
conflicts=()
makedepends=('intltool' 'dconf')
replaces=('ibus-cangjie-git')
install='ibus-cangjie.install'
sha512sums=('adbd51cbd6e4e816c12ab230c9173cf884fc300b886da51a40cb3956b66d43cb13fd477b4923b43032efb5c82d410c1766bb1f6d18445fa704b7db91e13d2497')
source=("https://github.com/Cangjians/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")


check () {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir/" install
}
