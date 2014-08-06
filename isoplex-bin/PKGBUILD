# Maintainer: thiagoc <root@thiagoc.net>
# https://github.com/thiagoc/aur-packages

pkgname=isoplex-bin
pkgver=0.0.5
pkgrel=3
pkgdesc='Watch movies online for free'
arch=('i686' 'x86_64')
url='http://isoplex.isohunt.to'
license=('custom')
optdepends=('libudev.so.0: install it if Isoplex does not run correctly')
conflicts=('isoplex')
options=('!strip')
_pkgarch='32'
_md5sum='78cc22c4f8fe4042a3277812cde01e14'
if [ "${CARCH}" == 'x86_64' ]; then
  _pkgarch='64'
  _md5sum='4279ef9e88f09cd3a80d80c61ada38e1'
fi
source=(http://isoplex.isohunt.to/files/default/linux${_pkgarch}.zip)
md5sums=($_md5sum)

package() {
  cd ${srcdir}/Isoplex
  install -dm 755 ${pkgdir}/opt/${pkgname}
  install -dm 755 ${pkgdir}/usr/bin
  install -Dm 755 Isoplex ${pkgdir}/opt/${pkgname}
  install -Dm 644 libffmpegsumo.so ${pkgdir}/opt/${pkgname}
  install -Dm 644 nw.pak ${pkgdir}/opt/${pkgname}
  ln -s /opt/${pkgname}/Isoplex ${pkgdir}/usr/bin
}

# vim:set ts=2 sw=2 et:
