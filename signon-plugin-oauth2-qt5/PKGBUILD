# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=signon-plugin-oauth2-qt5
_pkgname=signon-oauth2
pkgver=0.19
pkgrel=1
pkgdesc='OAuth 2 plugin for signon'
arch=('i686' 'x86_64')
url="http://code.google.com/p/accounts-sso/"
license=('LGPL')
depends=('signon-ui-qt5' 'qjson')
conflicts=('signon-plugin-oauth2')
makedepends=('signon-qt5')
source=(http://accounts-sso.googlecode.com/files/$_pkgname-$pkgver.tar.bz2)
md5sums=('32aa3b93b5d08c15a8e077d73bda61fa')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  sed -i '/-Werror/d' common-project-config.pri

  # Do not install tests and example
  echo 'INSTALLS =' >>tests/tests.pro
  echo 'INSTALLS =' >>example/example.pro
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