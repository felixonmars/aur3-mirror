# Maintainer: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=mvatom
pkgver=0.4.3
_pkgver=${pkgver}-20090409-200703
pkgrel=2
pkgdesc="Move files by atomic rename instead of copy"
arch=('i686' 'x86_64')
url="http://www.scylla-charybdis.com/tool.php/${pkgname}"
license=('GPL2')
depends=('glibc')
source=(http://www.scylla-charybdis.com/download/${pkgname}-${_pkgver}.tar.gz)
md5sums=('ceb036a93189e70b5243669c45538214')

build() {
  cd "$srcdir/${pkgname}-${_pkgver}"

  make || return 1
  install -d ${pkgdir}/usr/bin
  install -m 755 ${pkgname} ${pkgdir}/usr/bin/
  install -m 755 dirlist ${pkgdir}/usr/bin/
  ## install cmp
  install -m 755 cmpanddel.sh ${pkgdir}/usr/bin/
}

# vim:set ts=2 sw=2 et:
