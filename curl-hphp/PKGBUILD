# Maintainer: Spider.007 <archPackage@spider007.net>
# Contributor: Spider.007 <archPackage@spider007.net>
pkgname=curl-hphp
pkgver=7.27.0
pkgrel=1
pkgdesc="Patched curl for HipHop"
arch=('any')
url="http://wiki.github.com/facebook/hiphop-php/"
license=('custom')
depends=()
source=("http://curl.haxx.se/download/curl-$pkgver.tar.gz" "libcurl.fb-changes.diff")
md5sums=('f0e48fdb635b5939e02a9291b89e5336'
         '28b7f3479f24cfcc3161ba77566984c5')

build() {
  cd $srcdir/curl-$pkgver

  CMAKE_PREFIX_PATH=/opt/hiphop

  patch -p1 < $srcdir/libcurl.fb-changes.diff
  ./configure --prefix=$CMAKE_PREFIX_PATH
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
