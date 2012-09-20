# Maintainer: Silvio Knizek <killermoehred@gmx.net>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=catfish-search
_appname=catfish
_maj_pkgver=0.4
pkgver=${_maj_pkgver}.0.2
pkgrel=3
pkgdesc="A versatile file searching tool"
arch=('any')
url="http://twotoasts.de/index.php/catfish/"
license=('GPL')
provides=('catfish')
conflicts=('catfish')
depends=('pyxdg' 'xdg-utils' 'python2-gobject' 'hicolor-icon-theme')
optdepends=('zeitgeist: for zeitgeist integration'
            'findutils: for filename search'
            'locate: for faster filename search'
            'tracker: for fulltext search (Gnome)'
            'strigi: for fulltext search (KDE SC)'
            'pinot: for fulltext search (gtk3)'
            )
install=$pkgname.install
source=(https://launchpad.net/${pkgname}/${_maj_pkgver}/${pkgver}/+download/${_appname}-${pkgver}.tar.bz2)
md5sums=('d80eb544a12dbee2b2c84b63c4903eea')

build() {
  cd ${srcdir}/$_appname-$pkgver

  # python2 build fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  ./configure --prefix=/usr

  # Correct symlinks
  sed -i 's|ln -sf $(DESTDIR)/$(PREFIX)/share|ln -sf ..|' Makefile
  make
}

package () {
  cd ${srcdir}/$_appname-$pkgver

  make DESTDIR=${pkgdir} install

  # python2 run fix
  sed -i 's|python|python2|' ${pkgdir}/usr/bin/$_appname

  # icon file
  install -d ${pkgdir}/usr/share/pixmaps
  ln -s /usr/share/icons/hicolor/scalable/apps/$_appname.svg ${pkgdir}/usr/share/pixmaps/$_appname.svg
}
