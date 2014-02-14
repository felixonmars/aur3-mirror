pkgname=tokumx-ce
pkgver=1.4.0
pkgrel=1
pkgdesc='TokuMXTM is an open source, high-performance distribution of MongoDB that has dramatically improved scalability and operational efficiency.'
arch=('i686' 'x86_64')
url='http://www.tokutek.com/products/tokumx-for-mongodb/'
license=('AGPL3')
depends=('boost-libs' 'pcre' 'snappy' 'openssl' 'gperftools')
makedepends=('scons' 'boost' 'readline' 'ncurses' 'libpcap') # 'cyrus-sasl')
checkdepends=('python2-pymongo')
optdepends=('libpcap: needed for mongosniff')
conflicts=("mongodb")
backup=('etc/mongodb.conf')
install=mongodb.install
source=("mongo::https://github.com/Tokutek/mongo/archive/tokumx-${pkgver}.tar.gz"
        "ft-index::https://github.com/Tokutek/ft-index/archive/tokumx-${pkgver}.tar.gz"
        "jemalloc::https://github.com/Tokutek/jemalloc/archive/tokumx-${pkgver}.tar.gz"
        "backup-community::https://github.com/Tokutek/backup-community/archive/tokumx-${pkgver}.tar.gz"
        'mongodb.conf' 'mongodb.service' 'removeWerror.patch')

build() {
  # fucking mongo aint no fun to package
#  export SCONSFLAGS="$MAKEFLAGS"

#https://github.com/Tokutek/mongo/blob/master/docs/building.md
  ln -snf ../../jemalloc-tokumx-$pkgver ft-index-tokumx-$pkgver/third_party/jemalloc
  cd mongo-tokumx-${pkgver}
  ln -snf ../../../ft-index-tokumx-$pkgver src/third_party/ft-index
  ln -snf ../../../backup-community-tokumx-$pkgver/backup src/third_party/backup
  mkdir build || true

  cd build
  cmake -D CMAKE_BUILD_TYPE=Release -D TOKU_DEBUG_PARANOID=OFF -D USE_VALGRIND=OFF -D USE_BDB=OFF -D BUILD_TESTING=OFF -D TOKUMX_DISTNAME=1.4.0 -D CMAKE_INSTALL_PREFIX=/usr ..
  make

  # failed to build with -Werror since 2.4.0
 # patch -Np1 -i "$srcdir/removeWerror.patch"

#  scons all \
#    --use-system-boost \
#    --use-system-pcre \
#    --use-system-snappy \
#    --use-system-tcmalloc \
#    --ssl \
#    --sharedclient
    # --use-sasl-client
    # --use-system-v8
}

#<<COMMENT
#check() {
#  export SCONSFLAGS="$MAKEFLAGS"
#
#  cd mongodb-src-r${pkgver}
#
#  scons smokeAll --smokedbprefix=$srcdir
#}
#COMMENT


package() {
  #export SCONSFLAGS="$MAKEFLAGS"

  cd mongo-tokumx-${pkgver}
  cd build
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}/usr/lib64"/* "${pkgdir}/usr/lib"
  rm -rf "${pkgdir}/usr/lib64"

  rm "${pkgdir}/usr/bin/tokuftdump" # in mariadb
  rm "${pkgdir}/usr/include/db.h" #okay
  rm "${pkgdir}"/usr/lib/libgcc_s.so* #what the
  rm "${pkgdir}"/usr/lib/libstdc++.so* #why

#  scons install \
#    --use-system-boost \
#    --use-system-pcre \
#    --use-system-snappy \
#    --use-system-tcmalloc \
#    --ssl \
#    --sharedclient \
#    --full \
#    --prefix="$pkgdir/usr"
#    # --use-sasl-client
#    # --use-system-v8

  install -Dm644 "$srcdir/mongodb.conf" "$pkgdir/etc/mongodb.conf"
  install -Dm644 "$srcdir/mongodb.service" "$pkgdir/usr/lib/systemd/system/mongodb.service"
  install -dm700 "$pkgdir/var/lib/mongodb"
  install -dm755 "$pkgdir/var/log/mongodb"
}

md5sums=('86ea4675a32464c909097148b92c8051'
         'b6ada53b86fac7439b6d4db7a1398cef'
         '7091f378f9fe05ade26ca96082af4489'
         '0a9f4a115509508c0bf2cd7305117b37'
         '4839fe1d638187ca3226e8267b947318'
         '96ab4517b48974ce0e566d9746a75a4f'
         'c97f3fd59bbbdd9f0f6916322d95feb4')
