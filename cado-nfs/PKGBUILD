# Maintainer: Jérémie Detrey <Jeremie.Detrey@loria.fr>
pkgname=cado-nfs
pkgver=2.1.1
pkgrel=1
pkgdesc="Implementation of the Number Field Sieve (NFS) algorithm for factoring integers"
arch=('i686' 'x86_64')
url="http://cado-nfs.gforge.inria.fr/"
license=('LGPL2')
depends=('gmp' 'python' 'sqlite')
makedepends=('cmake' 'inetutils')
source=("https://gforge.inria.fr/frs/download.php/34110/${pkgname}-${pkgver}.tar.gz"
        default-source.patch)
md5sums=('33119af341066996540e3bae72a8c0be'
         'f3ad9502f28c469c73485e7a742c9d3f')

build() {
  cd "${pkgname}-${pkgver}"
  patch -p1 <../default-source.patch
  make PREFIX="/usr/libexec/cado-nfs"
  sed -i -e 's/^cado_source_dir=.*$/cado_source_dir="@CADO_NFS_SOURCE_DIR@"/;
             s/^cado_build_dir=.*$/cado_build_dir="@CADO_NFS_BINARY_DIR@"/' \
    "build/`hostname`/factor.sh"
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX="/usr/libexec/cado-nfs" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
