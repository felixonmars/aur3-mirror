# Maintainer: der_FeniX <derfenix@gmail.com>
# Contributor: Alexander Drozdov <adrozdoff@gmail.com>

pkgname=qross
_pkgname=Qross
pkgver=0.3.0
pkgrel=2
pkgdesc="Qt-only fork of Kross, the KDE scripting framework"
arch=('i686' 'x86_64')
url="http://github.com/0xd34df00d/Qross"
license=('GPL')
depends=('qt4')
makedepends=('git')
conflicts=('qross-git')
source=(https://github.com/0xd34df00d/$_pkgname/archive/$pkgver.tar.gz)
md5sums=('680cd8f4978fb17ff2dbf147197cb265')

build() {
  cd $srcdir/$_pkgname-$pkgver/src/qross

  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make  || return 1
  make DESTDIR=$pkgdir install
}

