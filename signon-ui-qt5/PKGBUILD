# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=signon-ui-qt5
_pkgname=signon-ui
pkgver=0.15
pkgrel=1
pkgdesc='UI component responsible for handling the user interactions which can happen during the login process of an online account'
arch=('i686' 'x86_64')
url="https://launchpad.net/online-accounts-signon-ui"
license=('GPL')
depends=('libaccounts-qt5' 'qt5-webkit' 'signon-qt5' 'libnotify')
conflicts=('signon-ui')
source=(https://launchpad.net/online-accounts-signon-ui/trunk/$pkgver/+download/$_pkgname-$pkgver.tar.bz2)
md5sums=('67ac8ce4cc85b69ec6ff67ae892fda90')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Do not install tests
  echo 'INSTALLS =' >>tests/unit/tst_inactivity_timer.pro
  echo 'INSTALLS =' >>tests/unit/tst_signon_ui.pro
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr LIBDIR=/usr/lib
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
