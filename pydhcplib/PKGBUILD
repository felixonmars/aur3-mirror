# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Ricardo Hernández <richerve@archlinux.com.ve>
# Maintainer: Ricardo Hernández <richerve@archlinux.com.ve>
pkgname=pydhcplib
pkgver=0.6.2
pkgrel=1
pkgdesc="Pydhcplib is a library to read, write, encode, and decode DHCP packets on a network. It also includes an admnistrator tool to send and receive DHCP traffic."
arch=('i686' 'x86_64' )
url="http://pydhcplib.tuxfamily.org/pmwiki/"
license=('GPLv3')
depends=('python')
makedepends=('python')
source=(http://pydhcplib.tuxfamily.org/download/${pkgname}-${pkgver}.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir || return 1
}

# vim:set ts=2 sw=2 et:
md5sums=('88b8ffeeb4e3d70efb1274e49c0f841b')
