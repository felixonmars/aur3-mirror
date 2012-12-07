# Contributor: Damien Churchill <damoxc@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Timm Preetz <timm@preetz.us>
# Contributor: Christer Nissen <christer.nissen@gmail.com>
# Contributor: Ner0

pkgname=vala-devel
pkgver=0.18.1
pkgrel=1
pkgdesc="Compiler for the GObject type system (development release)"
arch=('i686' 'x86_64')
url="http://live.gnome.org/Vala"
license=('LGPL')
depends=('glib2')
makedepends=('libxslt')
provides=("vala=$pkgver")
conflicts=('vala' 'vala-git')
options=('!libtool')
source=("http://ftp.gnome.org/pub/gnome/sources/${pkgname%-*}/${pkgver%.*}/${pkgname%-*}-${pkgver}.tar.xz")
sha256sums=('7f5e2e8ca03f9fa2cf13acaf93bfdc3a7ad0a10b000a337ba9c6bdc021bdca32')

build() {
  cd ${pkgname%-*}-${pkgver}
  ./configure --prefix=/usr --enable-vapigen
  make
}

package() {
  cd ${pkgname%-*}-${pkgver}
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
