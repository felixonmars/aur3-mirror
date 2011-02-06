# Maintainer: Nathan Owe <ndowens04+AUR @ gmail.com>
pkgname=monsoon
pkgver=0.21
pkgrel=1
pkgdesc="A Gtk sharp BitTorrent client"
arch=('i686' 'x86_64')
url="http://monsoon-project.org"
license=('custom')
depends=('mono' 'gtk-sharp-2' 'gnome-sharp' 'ndesk-dbus-glib' 'monotorrent' 'mono-nat')
source=(http://www.monsoon-project.org/jaws/data/files/$pkgname-$pkgver.tar.gz)
md5sums=('040c9d8a018c7e599bd2d6854f242756')

build() {
  export MONO_SHARED_DIR=$srcdir/.wapi
 install -d $MONO_SHARED_DIR $pkgdir/usr/share/licenses/$pkgname
    cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/
  rm -rf "$MONO_SHARED_DIR"
}
