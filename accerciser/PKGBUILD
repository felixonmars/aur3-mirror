# Maintainer: Steve Holmes <steve.holmes88@gmail.com>
# Contributor: Giulio Bai <giulio@hewle.com>

pkgname=accerciser
pkgver=3.2.1
pkgrel=1
pkgdesc="Interactive Python accessibility explorer for the GNOME desktop"
arch=('any')
url="http://live.gnome.org/Accerciser"
license=('BSD')
source=(http://ftp.gnome.org/pub/GNOME/sources/accerciser/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
md5sums=('862eb800643b822975f4f32e7da528ef')
depends=('gnome-python-desktop>=2.14'
         'pygtk>=2.8'
	 'python2>=2.4'
	 'ipython2'
	 'glib2>=2.10'
	 'at-spi2-core>=2.1.5'
       	 'dconf'
         'hicolor-icon-theme')
makedepends=('gnome-doc-utils' 'intltool' 'gobject-introspection')
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
