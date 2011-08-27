# Maintainer: Steve Holmes <steve.holmes88@gmail.com>
# Contributor: Giulio Bai <giulio@hewle.com>

pkgname=accerciser
pkgver=1.12.1
pkgrel=1
pkgdesc="Interactive Python accessibility explorer for the GNOME desktop"
arch=('i686' 'x86_64')
url="http://live.gnome.org/Accerciser"
license=('BSD')
source=("http://ftp.acc.umu.se/pub/GNOME/sources/$pkgname/1.12/$pkgname-$pkgver.tar.bz2")
depends=('gnome-python-desktop>=2.14'
         'pygtk>=2.8'
	 'python2>=2.4'
	 'ipython'
	 'glib2>=2.10'
	 'at-spi2-core>=0.3.3'
	 'gconf')

build () {
  cd $srcdir/$pkgname-$pkgver
  # Change hard coded references of python to python2
  sed -i -e 's|env python|env python2|' src/accerciser.in
  sed -i -e 's|bin/python|bin/python2|' plugins/*.py
  PYTHON=python2 ./configure --prefix=/usr --sysconfdir=/etc
  make
  make DESTDIR=${pkgdir} install
  install -m 755 -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -m 644 COPYING ${pkgdir}/usr/share/licenses/${pkgname} || return 1
}
md5sums=('b5e754c8bc89387a3cd3ec6c7f702aaa')
