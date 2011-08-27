# Maintainer: SpepS <dreamspepser at yahoo dot it>
# Contributor: Florian Pritz <f-p@gmx.at>

pkgname=gtknetcat
pkgver=0.1
pkgrel=4
pkgdesc="GUI for netcat"
arch=('any')
url="http://lxde.org"
license=('GPL')
depends=('gnu-netcat' 'python2')
makedepends=('intltool' 'gawk')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/lxde/$pkgname-$pkgver.tar.gz")
md5sums=('de545d2bce7878f0751e2cda3d2a4bce')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Python2 fixes
  export PYTHON="python2"
  sed -i "s_env python_&2_" src/$pkgname.*

  # Add icon in desktop file
  sed -i "s|Icon=|&gtk-network|" $pkgname.desktop*

  ./configure --prefix=/usr \
              --libexec=/usr/lib/python2.7/site-packages

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
