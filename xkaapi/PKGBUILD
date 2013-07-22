# Maintainer: Kniyl <mathias dot ettinger at gmail dot com>

pkgname=xkaapi
pkgver=2.1
pkgrel=1
_fileid=32735
pkgdesc="C++ library that implements work stealing algorithm for multithreaded computation"
url="http://kaapi.gforge.inria.fr/dokuwiki/doku.php"
arch=('i686' 'x86_64')
license=('custom:CeCILL-C')
depends=('glibc' 'hwloc')
source=("https://gforge.inria.fr/frs/download.php/${_fileid}/$pkgname-$pkgver.tar.gz"
        "Licence_CeCILL-C_V1-en.txt")
md5sums=('585eee76e0f8f5beae46ceb92c632665'
         '1098a2ce8d6a346ac769d4ec0f3f4c88')
options=(!libtool)

prepare() {
  cd "${srcdir}"
  rm -rf ${pkgname}-build
  cp -r ${pkgname}-${pkgver} ${pkgname}-build

  sed -i 's|1.13|1.14|g' ${pkgname}-build/configure
#  msg "Applying patches..."
#  sed -i 's|  bool work_queue|  inline bool work_queue|g' \
#    ${pkgname}-build/api/kastl/kastl/kastl_workqueue.h 
}

build() {
  cd ${pkgname}-build

  msg "Starting make..."

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
  cd ${pkgname}-build
  make DESTDIR="${pkgdir}" install
  install -Dm644 "$srcdir/Licence_CeCILL-C_V1-en.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 
}
