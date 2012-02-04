# Contributor: Brix <brix@brix-verden.dk>

pkgname=d-buildtool-rebuild
pkgver=0.78
pkgrel=1
pkgdesc="A popular build tool for the D Programming Language."
url="http://dsource.org/projects/dsss"
arch=('i686', 'x86_64')
license=('custom')
if [[ $CARCH == "x86_64" ]]; then
  depends=('lib32-gcc-libs')
fi
source=('http://svn.dsource.org/projects/dsss/downloads/0.78/dsss-0.78-x86-gnuWlinux.tar.bz2')
md5sums=('8107386d60268e400d3c8d1e8857a1af')

build() {
  cd ${srcdir}/dsss-0.78-x86-gnuWlinux

  mkdir -p ${pkgdir}/usr/bin ${pkgdir}/usr/share

  cp -r etc ${pkgdir} || return 1
  cp -r bin ${pkgdir}/usr || return 1
  cp -r share ${pkgdir}/usr
  echo "profile=ldc-posix-tango" > ${pkgdir}/etc/rebuild/default
}
