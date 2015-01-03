# Maintainer: Jesus Alvarez <jeezusjr at gmail dot com>
# Contributor: Kyle Fuller <inbox at kylefuller dot co dot uk>

pkgname=("spl-dkms-therp")
pkgver=0.6.3_1.2
github_pkg=spl-${pkgver/_/-}
pkgrel=1
pkgdesc="Solaris Porting Layer kernel modules."
depends=("spl-utils-therp=${pkgver}-${pkgrel}" "dkms")
arch=("i686" "x86_64")
url="http://zfsonlinux.org/"
source=(https://github.com/zfsonlinux/spl/archive/${github_pkg}.tar.gz)
groups=("archzfs")
license=("GPL")
install=spl-dkms-therp.install

build() {
  cd "$srcdir/spl-${github_pkg}"
  ./autogen.sh
  scripts/dkms.mkconf -v ${pkgver} -f dkms.conf -n spl
}

package_spl-dkms-therp() {
   install -d ${pkgdir}/usr/src/
   cp -a ${srcdir}/spl-${github_pkg} ${pkgdir}/usr/src/spl-${pkgver}
}

md5sums=('105d4abcaa9801be0034dba29a1951d1')
