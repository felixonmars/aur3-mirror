# $Id: PKGBUILD 65487 2012-02-21 06:06:09Z spupykin $
# Maintainer: Rene Peinthor <peinthor@gmail.com>

pkgname=sqlitebrowser-stable
_pkgname=sqlitebrowser
pkgver=3.4.0
pkgrel=1
pkgdesc="SQLite Database browser is a light GUI editor for SQLite databases, built on top of QT"
arch=('i686' 'x86_64')
url="https://github.com/sqlitebrowser/sqlitebrowser"
license=('GPL')
depends=('qt5-base' 'qt5-tools' 'sqlite3')
makedepends=('cmake')
provides=('sqlitebrowser')
conflicts=('sqlitebrowser')
source=("https://github.com/sqlitebrowser/sqlitebrowser/archive/v${pkgver}.tar.gz")
md5sums=('bad4cd0f9b88aa834b207d420d196b0a')

build() {
  cd "$srcdir"
  msg "Starting build..."

  cd "$srcdir/$_pkgname-$pkgver"
  cmake -DCMAKE_BUILD_TYPE=Release -DUSE_QT5=True .
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  mkdir -p "$pkgdir"/usr/bin
  install -m755 $_pkgname "$pkgdir"/usr/bin/

  mkdir -p "$pkgdir"/usr/share/$_pkgname/icons/
  cp src/icons/sqlitebrowser.png "$pkgdir"/usr/share/$_pkgname/icons/$_pkgname-128.png

  install -D -m644 distri/${_pkgname}.desktop "${pkgdir}"/usr/share/applications/${_pkgname}.desktop
}
