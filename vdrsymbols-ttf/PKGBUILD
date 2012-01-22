# Contributor: David Spicer <azleifel at googlemail dot com>

pkgname=vdrsymbols-ttf
_pkg_source_dir=vdrsymbols
pkgver=20100612
pkgrel=2
arch=('any')
pkgdesc="A TrueType font that includes the symbols used by some VDR plugins and patches"
url="http://andreas.vdr-developer.org/fonts/"
license=('custom')
depends=('xorg-font-utils')
install=vdrsymbols-ttf.install
source=(http://andreas.vdr-developer.org/fonts/download/${pkgname}-${pkgver}.tgz)
md5sums=('dad98a1cdb2b7deb3301ecf46181d258')

build() {
  cd ${srcdir}/${_pkg_source_dir}
  install -d -m755 ${pkgdir}/usr/share/fonts/TTF || return 1
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/ || return 1
  install -d -m755 ${pkgdir}/usr/share/licenses/${pkgname} || return 1
  install -m644 COPYRIGHT.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt || return 1
}

