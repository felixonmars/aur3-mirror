# Maintainer: Kniyl <mathias dot ettinger at gmail dot com>

pkgname=xkaapi-git
_gitname='xkaapi'
pkgver=2.1
pkgrel=1
pkgdesc="C++ library that implements work stealing algorithm for multithreaded computation (Git version)"
url="http://kaapi.gforge.inria.fr/dokuwiki/doku.php"
arch=('i686' 'x86_64')
provides=('xkaapi')
conflicts=('xkaapi')
depends=('glibc' 'hwloc')
makedepends=('git')
license=('custom:CeCILL-C')
source=("${_gitname}::git://scm.gforge.inria.fr/kaapi/kaapi.git"
        "Licence_CeCILL-C_V1-en.txt")
md5sums=('SKIP' '1098a2ce8d6a346ac769d4ec0f3f4c88')
options=(!libtool)

pkgver() {
  cd $_gitname
  git describe --always | sed 's|xkaapi_||g' | sed 's|-|.|g'
}

prepare() {
  cd $_gitname

  msg "Applying patches..."
  sed -i 's|  bool work_queue|  inline bool work_queue|g' \
    api/kastl/kastl/kastl_workqueue.h
}

build() {
  cd $_gitname
  
  msg "Starting make..."
  ./bootstrap
  ./configure \
    --prefix=/usr \
    --enable-mode=release \
    --disable-api-kaapif \
    --disable-api-kastl \
    --disable-libkomp \
    --enable-api-kaapic \
    --enable-api-kaapixx \
    --disable-api-quark

  make 
}

package() {
  cd $_gitname
  make DESTDIR="${pkgdir}" install
  install -Dm644 "$srcdir/Licence_CeCILL-C_V1-en.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 
}
