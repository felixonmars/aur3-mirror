# Contributor: Karol Grochowalski <karol.grochowalski@gmail.com>

pkgname=kadu-beta1
pkgver=0.6.6
pkgrel=0
pkgdesc="A Qt-based Gadu-Gadu client"
arch=('i686' 'x86_64')
url="http://www.kadu.net/"
license=('GPL')
depends=('qt' 'libgadu-devel' 'hicolor-icon-theme')
makedepends=('cmake' 'aspell' 'libao' 'libsndfile' 'libxtst' 'curl'  'qca' 'libxss')
conflicts=('kadu-svn')
source=(http://www.kadu.net/download/unstable/kadu-$pkgver-beta1.tar.bz2)
md5sums=('4e4f1f3b7709073288bcdaf881c5230f')

build() {
  cp $startdir/config $startdir/src/kadu/.config
  cd $startdir/src/kadu



  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1

  rm -rf $startdir/pkg/usr/{lib,include}/{libgadu*,pkgconfig}
  rm -rf $startdir/pkg/usr/share/kadu/{HISTORY,README}
}
