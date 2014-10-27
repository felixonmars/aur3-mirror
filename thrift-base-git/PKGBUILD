# Maintainer: Yen Chi Hsuan <yan12125@gmail.com>
# Contributor: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Byron Clark <byron@theclarkfamily.name>
_pkgname=thrift-base
pkgname=${_pkgname}-git
pkgver=20141023
pkgrel=1
pkgdesc="The compiler for Thrift, a scalable cross-language services framework for IPC/RPC (Git version)"
arch=(i686 x86_64)
url="http://thrift.apache.org/"
license=(APACHE)
depends=(zlib libevent openssl)
makedepends=('git')
options=(!emptydirs !makeflags)
source=("${_pkgname}"::"git+https://github.com/apache/thrift.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
  cd ${srcdir}/${_pkgname}

  ./bootstrap.sh
  ./configure --prefix=/usr \
    --without-cpp \
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

  make
}

package() {
  cd ${srcdir}/${_pkgname}
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
