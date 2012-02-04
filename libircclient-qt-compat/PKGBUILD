# Contributor: Scott Olson <scott@scott-olson.org>
# Maintainer: Marek Otahal <markotahal et gmail >
pkgname=libircclient-qt-compat
_pkg=communi-communi
pkgver=0.3.2
_ver=0.3
pkgrel=2
pkgdesc="A cross-platform IRC client library written with Qt 4, (former kopete-plugin-irc), now communi to allow IRC chat in Kopete"
arch=(i686 x86_64)
url="https://gitorious.org/communi/"
license=('LGPL')
depends=(qt\>=4.0)
optdepends=(icu)
provides=(libircclient-qt)
conflicts=(libircclient-qt)
source=(https://gitorious.org/communi/communi/archive-tarball/$_ver)
md5sums=('339f64ead3526357cc517539f994620a')

build() {
  cd "$srcdir/${_pkg}"

  qmake -config release
  make 
  make INSTALL_ROOT=$pkgdir QTDIR=/usr install
}

# vim:set ts=2 sw=2 et:
