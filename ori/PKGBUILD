# Maintainer: Cameron Matheson <cameron.matheson@gmail.com>
pkgname=ori
pkgver=0.8.1
pkgrel=1
pkgdesc="a secure distributed file system"
arch=('i686' 'x86_64')
url="http://ori.scs.stanford.edu/"
license=('custom:MIT')
depends=(libevent fuse)
makedepends=(scons boost)
provides=(ori)
conflicts=(ori)
options=(!strip)
source=("https://bitbucket.org/orifs/ori/downloads/$pkgname-$pkgver.tar.xz")
md5sums=('3de18af736eb8f3048fd2ee483c6f41c')


build() {
  cd $pkgname-$pkgver
  echo $pkgdir
  scons BUILDTYPE=DEBUG
}

package() {
  cd $pkgname-$pkgver
  scons PREFIX="$pkgdir/usr" BUILDTYPE=DEBUG install
}
