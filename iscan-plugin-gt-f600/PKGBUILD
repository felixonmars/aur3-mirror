# Maintainer: Sam Smith Repo <oommmmmmmo@gmail.com>
# Based on the PKGBUILD from http://aur.archlinux.org/packages.php?ID=40933

pkgname=iscan-plugin-gt-f600
pkgver=1.0.0_1
pkgrel=1
pkgdesc="iscan plugin for Epson Perfection 4180 / GT-F600"
arch=('i686' 'x86_64')
url="http://avasys.jp/eng/linux_driver/"
license=('custom')
depends=('iscan')
makedepends=('rpmextract')
install=gt-f600.install

  _VERSION="1.0.0-1"
  source=(http://a1227.g.akamai.net/f/1227/40484/7d/download.ebz.epson.net/dsc/f/01/00/01/58/53/83d8bde88f5eb5cd635010d62fc88f87f57181bf/${pkgname}-${_VERSION}.c2.i386.rpm)
  _ARCH=i386
  md5sums=('5f4137fd69198617b95bd59261affd75')

package() {
  cd ${startdir}
  rpmextract.sh ${pkgname}-${_VERSION}.c2.i386.rpm
  mv usr ${pkgdir}
  mkdir -p ${pkgdir}/usr/share/licenses/iscan
  mv ${pkgdir}/usr/share/doc/${pkgname}-${_VERSION%-*}/EAPL.en.txt ${pkgdir}/usr/share/licenses/iscan/
  rm -rf ${pkgdir}/usr/share/doc
}

