# Maintainer: Jesus Alvarez <jeezusjr at gmail dot com>
# Contributor: Kyle Fuller <inbox at kylefuller dot co dot uk>

pkgname="spl-dkms-therp-git"
pkgrel=1
pkgver=0.6.2_r23.g4c99541
_pkgver=${pkgver/_*/}
pkgdesc="Solaris Porting Layer kernel modules."
depends=("spl-utils-therp-git" "dkms")
conflicts=("spl-dkms-therp")
arch=("i686" "x86_64")
url="http://zfsonlinux.org/"
source=(git://github.com/zfsonlinux/spl.git)
groups=("archzfs")
license=("GPL")
install=spl-dkms-therp.install

pkgver() {
  cd "$srcdir/spl"
  git describe --long | sed -E 's/-([^-]*-g)/_r\1/;s/-/./g;s/spl\.//'
}

build() {
  cd "$srcdir/spl"
  ./autogen.sh
  scripts/dkms.mkconf -v ${_pkgver} -f dkms.conf -n spl
}

package() {
   depends=("spl-utils-therp-git=${pkgver}" "dkms")

   install -d ${pkgdir}/usr/src/spl-${_pkgver}
   cp -a -T ${srcdir}/spl/ ${pkgdir}/usr/src/spl-${_pkgver}
}

md5sums=('SKIP')
