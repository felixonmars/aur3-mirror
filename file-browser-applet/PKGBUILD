# Maintainer: Prasad
pkgname=file-browser-applet
pkgver=0.6.6
pkgrel=1
pkgdesc="An applet for the Gnome Panel"
arch=('i686' 'x86_64')
url="http://code.google.com/p/gnome-menu-file-browser-applet/"
license=("GPL")
depends=('gnome-panel')
optdepends=('gtkhotkey')
makedepends=('cmake' 'pkgconfig')
replaces=('menu-file-browser-applet')
source=(http://gnome-menu-file-browser-applet.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('7a3eabb266185156731f184e68506dae')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -D CMAKE_INSTALL_PREFIX=/usr . || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir/" install || return 1

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
