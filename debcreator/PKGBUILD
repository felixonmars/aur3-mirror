# Maintainer: Jakub Kozisek <nodevel at gmail dot com>

pkgname=debcreator
pkgver=0.3.9.4
pkgrel=6
pkgdesc="GTK wizard tool to build deb packages easily"
arch=('i686' 'x86_64')
url="http://debcreator.cmsoft.net"
license=('GPL')
makedepends=('gcc')
depends=('atk' 'libart-lgpl' 'libbonobo' 'libbonoboui' 'cairo' 'fontconfig' 'glib2' 'gconf' 'gnome-keyring' 'libgnome' 'libgnomeui' 'gnome-vfs' 'gtk2' 'libice' 'orbit2' 'pango' 'libsm' 'libx11' 'libxcursor' 'libxext' 'libxfixes' 'libxi' 'libxinerama' 'libxml2' 'libxrandr' 'libxrender' 'debhelper' 'fakeroot' 'make' 'dpkg')
optdepends=('tar' 'gzip' 'bzip2')
provides=('debcreator')
source=(http://debcreator.cmsoft.net/files/$pkgver/$pkgname-$pkgver.tar.gz)

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure
  make
  make install DESTDIR="$pkgdir/" || return 1
}
md5sums=('24b16489b7d8f3c5fe4358ae2682a1f1')