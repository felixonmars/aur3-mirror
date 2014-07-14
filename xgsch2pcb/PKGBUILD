# Maintainer: David Manouchehri <d@32t.ca>
# Contributor: Jared Casper <jaredcasper@gmail.com>
pkgname=xgsch2pcb
pkgver=0.1.3
pkgrel=1
pkgdesc="an intuitive, user-friendly graphical interface to the gsch2pcb command-line tool"
url="http://geda.seul.org/tools/xgsch2pcb/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk2' 'python' 'dbus-python' 'pygtk' 'geda-gaf' 'pcb')
install=$pkgname.install
source=("ftp://ftp.tr.debian.org/gentoo/distfiles/geda-$pkgname-$pkgver.tar.gz")
sha512sums=('24d8c798be49a0aa09c12c97eb6d33e1bd5ccf1a866a8889dd04e3dd2035afd6b8799638d696691216df9d5c645922b8cfb5aadc1373d15c6ee62eec0f72b965')

build ()
{
  cd $srcdir/geda-$pkgname-$pkgver/
  ./configure --prefix=/usr \
              --disable-update-desktop-database || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}

