# Contributor: Kessia 'even' Pinheiro <kessiapinheiro at gmail.com>
pkgname=grcm
pkgver=0.1.6
pkgrel=1
pkgdesc="GUI program to launch applications like telnet, shh, or rdesktop"
arch=('i686')
url="http://grcm.sourceforge.net"
license=('GPL')
depends=('libart-lgpl' 'atk' 'libbonobo' 'libbonoboui' 'glib2' 'gconf' 'libgnome' 'libgnomecanvas' 'libgnomeui' 'gnome-vfs' 'gtk' 'libice' 'orbit2' 'pango' 'popt' 'libsm' 'libxml2' 'zlib')
optdepends=('gftp: ftp support'
	    'ssh: ssh support'
	    'grdesktop: rdesktop support')
makedepends=('make')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
md5sums=('74ee03719fdfde1140a8a5b01a85db42')
