# Contributor: Wei-Ning Huang <aitjcize@gmail.com>
# Contributor: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Byron Clark <byron@theclarkfamily.name>
pkgname=thrift-cpp-git
pkgver=20140509
pkgrel=1
pkgdesc="C++ bindings for Thrift, a scalable cross-language services framework for IPC/RPC"
arch=(i686 x86_64)
url="http://thrift.apache.org/"
license=(APACHE)
depends=(boost-libs zlib libevent openssl)
makedepends=(boost automake autoconf libtool)
optdepends=(
  'thrift-base: for the Thrift compiler'
  'vim-thrift: for syntax highlighting in vim')
options=(!emptydirs !makeflags)
source=(git://github.com/apache/thrift.git)
md5sums=('SKIP')

pkgver() {
  date '+%Y%m%d'
}


build() {
  cd ${srcdir}/thrift

  ./bootstrap.sh
  ./configure --prefix=/usr \
    --with-cpp \
    --without-qt4 \
    --without-c_glib \
    --without-csharp \
    --without-java \
    --without-erlang \
    --without-perl \
    --without-php \
    --without-php_extension \
    --without-python \
    --without-ruby \
    --without-haskell \
    --without-go \
    --without-d \
    --without-lua \
    --without-nodejs

  make -j`nproc`
}

package() {
  cd ${srcdir}/thrift
  make DESTDIR=${pkgdir} install
  rm -r ${pkgdir}/usr/bin
}

# vim:set ts=2 sw=2 et:
