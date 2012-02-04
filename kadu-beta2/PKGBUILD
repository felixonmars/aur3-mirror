# Contributor: quasi <quasi@aur.archlinux.org>

pkgname=kadu-beta2
pkgver=0.6.6
pkgrel=1
pkgdesc="A Qt-based Gadu-Gadu client"
arch=('i686' 'x86_64')
url="http://www.kadu.net/"
license=('GPL')
depends=('qt' 'libgadu' 'hicolor-icon-theme')
makedepends=('cmake' 'aspell' 'libao' 'libsndfile' 'libxtst' 'curl' 'xmms' 'qca' 'libxss')
conflicts=('kadu-svn' 'kadu' 'kadu-beta1')
install=kadu.install
source=(http://www.kadu.net/download/unstable/kadu-0.6.6-beta2.tar.bz2)
md5sums=('c51915c9abd1fb5bab2286b571e5751a')

build() {
  cd $srcdir/kadu

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  rm -rf $pkgdir/usr/{lib,include}/{libgadu*,pkgconfig}
  rm -rf $pkgdir/usr/share/kadu/{HISTORY,README}
}
