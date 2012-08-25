# Maintainer: Dirk <lowph at lotje com>
# Contributor: Matías Hernández  <msdark@archlinux.cl>

pkgname=gtaskmanager
pkgver=0.1
pkgrel=3
pkgdesc="Small task manager for GTK+, fork of xfce4-taskmanager without xfce dependencies"
arch=(i686 x86_64)
url="http://oliwer.net/b/gtaskmanager.html"
license=('GPL')
groups=(system)
depends=(gtk2)
install=gtaskmanager.install
source=(http://olwtools.googlecode.com/files/gtaskmanager-$pkgver.tar.gz
        "$pkgname.desktop")
noextract=()
md5sums=('8d2eba105ba9899ceca818d922927fb9'
         '0169638354ca27f4d985dfcd5cc980e9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
  make DESTDIR="$pkgdir/" install
}

package() {
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
