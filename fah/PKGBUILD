# Maintainer: ztroumpf <fpeterscom@yahoo.fr>

pkgname=fah
pkgver=6.02_29
_32pkgver=6.02
_64pkgver=6.29
pkgrel=7
pkgdesc="Distributed computing project which studies protein folding, misfolding, aggregation, and related diseases. i686 and x86_64"
arch=('i686' 'x86_64')
url="http://folding.stanford.edu/"
license=('custom')
depends=('bash')
makedepends=('patch')

backup="etc/conf.d/fah"

if [[ $CARCH == "i686" ]]; then
    _pkgver=${_32pkgver}
else
    _pkgver=${_64pkgver}
fi

install=$pkgname.install
source=(http://www.stanford.edu/group/pandegroup/folding/release/FAH${_pkgver}-Linux.tgz \
    fahpatch_${_32pkgver}.diff \
    fahpatch_${_64pkgver}.diff)


build() {
  cd ${srcdir}

  patch -p1 < fahpatch_${_pkgver}.diff || return 1

  install -D -c -m755 fah6 ${pkgdir}/opt/fah/fah6 || return 1
  install -D -c -m755 ${srcdir}/fah.rc.d \
    ${pkgdir}/etc/rc.d/$pkgname || return 1
  install -D -c -m644 ${srcdir}/$pkgname.conf.d \
    ${pkgdir}/etc/conf.d/$pkgname || return 1
  install -D -m644 $pkgname.license ${pkgdir}/usr/share/licenses/$pkgname/COPYING || return 1 
}

if [[ $CARCH == "i686" ]]; then
md5sums=('112b3d66909050f1bb990993a1464cb9'
         '59bd85738acb714138184d9a13e154ed'
         'a8dec4df46309eda548774390e7597db')
else
md5sums=('e96acd44aae5ff42a521fd8f5022c142'
         '59bd85738acb714138184d9a13e154ed'
         'a8dec4df46309eda548774390e7597db')
fi
