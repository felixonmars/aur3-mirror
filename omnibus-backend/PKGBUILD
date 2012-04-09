# Maintainer: Florian Merz <fiji@fiji-flo.de>

pkgname=omnibus-backend
pkgver=420
pkgrel=1
pkgdesc="send files to a friend or get files a friend has prepared for you to download"
arch=('i686' 'x86_64')
url="http://omnifile.org/"
license=('GPL')
depends=('ariba')
makedepends=('cmake' 'subversion')
source=(omnibus-backend.patch)
md5sums=('d222583633699cd3333fabc80ee445de')

build() {
  svn co http://omnibus-filetransfer.googlecode.com/svn/branches/stable/omnibus-filetransfer/omnibus-backend
  msg "SVN checkout done or server timeout"
  msg "patching"
  cd omnibus-backend
  patch -p1 < ../../omnibus-backend.patch
  msg "Starting make..."
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make -j2
}

package() {
  cd omnibus-backend/build

  make DESTDIR="$pkgdir" install
}
