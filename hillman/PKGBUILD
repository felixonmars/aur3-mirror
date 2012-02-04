# Contributor: Andrey 'OldMan' Teleshov <tele-post@mail.ru>
pkgname=hillman
pkgver=0.3.3
pkgrel=1
pkgdesc="Manual (via mouse clicking into tray) disk mounting manager for Linux"
arch=(any)
url="http://www.oldman.tk/hillman/"
license=('GPL')
depends=(perl gtk2-perl perl-gtk2-trayicon perl-locale-gettext inotify-tools sudo)
source=(http://www.oldman.tk/hillman/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make PREFIX=/usr || return 1
  make PREFIX=/usr DESTDIR="$pkgdir/" install

  install -m755 -d $pkgdir/usr/share/doc/$pkgname
  install -m644    AUTHORS COPYING README README.ru TODO \
                   $pkgdir/usr/share/doc/$pkgname/
}

md5sums=('17f3905d445be8e9c89a97bbca10c842')
