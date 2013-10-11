# Maintainer: Jérémie Detrey <Jeremie.Detrey@loria.fr>
_pkg=cado-nfs
pkgname=${_pkg}-git
pkgver=20131011.cf22702
pkgrel=1
pkgdesc="Implementation of the Number Field Sieve (NFS) algorithm for factoring integers"
arch=('i686' 'x86_64')
url="http://cado-nfs.gforge.inria.fr/"
license=('LGPL2')
depends=('gmp' 'python' 'sqlite')
makedepends=('git' 'cmake' 'inetutils')
source=("git://scm.gforge.inria.fr/cado-nfs/${_pkg}.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkg"
  git log -1 --format="%cd.%h" --date=short | sed 's/-//g'
}

build() {
  cd "$_pkg"
  make PREFIX="/usr/libexec/cado-nfs"
  sed -i -e 's/^cado_source_dir=.*$/cado_source_dir="@CADO_NFS_SOURCE_DIR@"/;
             s/^cado_build_dir=.*$/cado_build_dir="@CADO_NFS_BINARY_DIR@"/' \
    "build/`hostname`/factor.sh"
}

package() {
  cd "$_pkg"
  make PREFIX="/usr/libexec/cado-nfs" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
