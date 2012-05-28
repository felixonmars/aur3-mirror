# Contributor: quasi <quasi@aur.archlinux.org>

pkgname=kadu-devel
pkgver=0.12.0
_pkgver=0.12.0-rc1
pkgrel=7
pkgdesc="A Qt-based Gadu-Gadu/Jabber client"
arch=('i686' 'x86_64')
url="http://www.kadu.net/"
license=('GPL')
depends=('qt' 'libgadu-devel-pre' 'libidn' 'libmpdclient')
makedepends=('cmake' 'aspell' 'libao' 'libsndfile' 'libxtst' 'curl' 'qca' 'qca-ossl' 'libxss' 'phonon')
conflicts=('kadu-svn' 'kadu' 'kadu-beta1' 'kadu-beta2')
source=(http://download.kadu.im/unstable/kadu-$_pkgver.tar.bz2)
md5sums=('75f189ae204e3e532bf74937a3cdaae9')

build() {
  cd $srcdir/kadu-$_pkgver

  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE="Release"
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  rm -rf $pkgdir/usr/{lib,include}/{libgadu*,pkgconfig}
  rm -rf $pkgdir/usr/share/kadu/{HISTORY,README}
}
