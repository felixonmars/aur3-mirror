# Contributor: Javier "Phrodo_00" Aravena <javier@aravenas.com>
pkgname='rgnome'
pkgver='0.1.9_alpha'
_REALVER='0.1.9-alpha'
pkgrel=3
pkgdesc="Gtk based frontend for GNU R"
arch=('i686' 'x86_64')
url="http://rgnome.boltzmann-konstante.de/"
license=('GPL')
depends=('python-rpy' 'vte' 'gnome-python' 'python-gnomeprint' 'pygtksourceview')
source=("http://rgnome.boltzmann-konstante.de/${pkgname}-${_REALVER}.tar.gz")
md5sums=('8864da7217ac56a110f95ab2fdccbd83')

build() {
  cd $srcdir/$pkgname-$_REALVER

  sed 's/python/python2/' -i Makefile rgnome.py rgnome
  make || return 1
  make DESTDIR=$pkgdir PREFIX='/usr' install

  sed -i -e 's|/usr/lib/|/opt/mozilla/lib/|' -e 's|/usr/local/|/usr/|' "${startdir}/pkg/usr/bin/rgnome"
}

# vim:set ts=2 sw=2 et:
