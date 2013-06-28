# Contributor: Tocer Deng <tocer.deng@gmail.com>
pkgname=mime-support
pkgver=3.52_1
_pkgver=3.52-1
pkgrel=3
pkgdesc="Mailcap and support programs from debian"
arch=('i686' 'x86_64')
url="http://packages.debian.org/en/sid/mime-support"
license=('custom')
depends=('perl' 'file' 'mime-types' 'debianutils')
source=(http://ftp.us.debian.org/debian/pool/main/m/mime-support/${pkgname}_${_pkgver}_all.deb)
noextract=()
md5sums=('04f833f65b2f12dd4c73668877ce78aa')

build() {
  cd "$srcdir"
  bsdtar xOf ${pkgname}_${_pkgver}_all.deb data.tar.gz | bsdtar xf - -C ${pkgdir}
  rm ${pkgdir}/etc/mime.types
  mv ${pkgdir}/usr/bin/{edit,alter}
  mv ${pkgdir}/usr/{sbin,bin}/update-mime
  mv ${pkgdir}/usr/share/man/man1/{edit,alter}.1.gz
  mkdir -p ${pkgdir}/usr/share/licenses/mime-support
  cp ${pkgdir}/usr/share/doc/mime-support/copyright ${pkgdir}/usr/share/licenses/mime-support/
  rm -rf ${pkgdir}/usr/share/doc
  rmdir ${pkgdir}/usr/sbin
}

# vim:set ts=2 sw=2 et:
