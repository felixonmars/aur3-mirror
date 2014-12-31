# Maintainer: Junchun Guan <junchunx.guan@gmail.com>
pkgname=obs-build-tizen
pkgver=2013.11.12
pkgrel=3.1
pkgdesc="Building part of the OpenSUSE Build Service, osc-build - git version"
url="http://build.opensuse.org"
arch=(any)
license=("GPL")
depends=(bash perl rpm-org xz perl-crypt-ssleay)
provides=(obs-build)
conflicts=(obs-build)
source=(http://download.tizen.org/tools/archive/14.03.1/openSUSE_13.1/src/build-20131112-7.1.src.rpm)
sha256sums=('c80855419dc1174af49720e90faf94aaf38e618155775a07159db9fb65c5a033')

prepare()
{
  cd "$srcdir"
  tar -x -f obs-build-$pkgver.tar.gz
  cd "$srcdir/obs-build-${pkgver}"
  for patch_file in $(find ../ -maxdepth 1 -name '*.patch' |sort)
  do
    patch -p1 -i $patch_file
  done
}

build() {
  cd "$srcdir/obs-build-${pkgver}"
  make initvm-all
}

package() {
  cd "$srcdir/obs-build-${pkgver}"
  make initvm-install DESTDIR="$pkgdir"
  make install DESTDIR="$pkgdir"
}
