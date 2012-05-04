# Maintainer: Steve Holmes <steve.holmes88@gmail.com>
# Contributor: Giulio Bai <giulio@hewle.com>

pkgname=accerciser
pkgver=3.4.1
pkgrel=2
pkgdesc="Interactive Python accessibility explorer for the GNOME desktop"
arch=('any')
url="http://live.gnome.org/Accerciser"
license=('BSD')
source=(http://ftp.gnome.org/pub/GNOME/sources/accerciser/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
md5sums=('fba7edb13dd80ef63e6044b411a6a84f')
depends=('python2-cairo'
         'python2-gobject'
	 'pyatspi'
	 'at-spi2-atk'
	 'libwnck3'
	 'ipython2'
         'hicolor-icon-theme')
makedepends=('gnome-doc-utils' 'intltool')
install=accerciser.install

build () {
  cd "$srcdir/$pkgname-$pkgver"

  # Change hard coded references of python to python2
  sed -i -e 's|env python|env python2|' src/accerciser.in
  sed -i -e 's|bin/python|bin/python2|' plugins/*.py

  PYTHON=python2 ./configure --prefix=/usr --sysconfdir=/etc \
                 --disable-schemas-compile
  make
}

package () {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=${pkgdir} install
  install -m 755 -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -m 644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}
}
