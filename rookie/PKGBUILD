# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=rookie
pkgver=0.2.6
pkgrel=3
pkgdesc="A simple, lightweight, yet quite featureful download manager for GNOME."
url="http://gtk-apps.org/content/show.php/Rookie+Download+Manager?content=135883"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('dconf' 'gtk3' 'libnotify' 'libsoup')
makedepends=('intltool')
options=('!libtool')
source=(http://rookie-dm.googlecode.com/files/${pkgname}_${pkgver}.tar.gz)
install=$pkgname.install
md5sums=('9d3900dd813e511da673fd9b6dd5e111')

build() {
  cd $srcdir/$pkgname

  export CFLAGS="-I/usr/include/libnotify"
  sed -i 's|NULL|gio_backend|' src/g-downloadable-backends.c
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname
  make DESTDIR=$pkgdir install

  # Fix tray icon
  mkdir -p $pkgdir/usr/local/share/icons/hicolor
  mv $pkgdir/usr/share/icons/hicolor/scalable $pkgdir/usr/local/share/icons/hicolor/scalable
  rm -rf $pkgdir/usr/share/icons

  # Fix desktop file
  sed -i '12d' $pkgdir/usr/share/applications/rookie.desktop
}