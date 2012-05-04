# Maintainer: dryes <joswiseman@gmail>
pkgname='resample-bin'
pkgver=1.2
pkgrel=1
pkgdesc='ReSample is a companion to ReScene, and it does for samples what ReScene does for RARs.'
url='http://rescene.com/resample/index.htm'
arch=('any')
license=('Custom')
depends=('mono')
makedepends=('unrar')
source=('http://dl.dropbox.com/u/7803404/srs.1.2.rar' 'srs.sh')
noextract=('srs.1.2.rar')
provides=('resample')
md5sums=('58822bf70fb09796e919ba7a3f7704ec' '642fe315c4227d545e7d67e1c247b5b3')

package() {
  mkdir -p "${pkgdir}/opt/resample"
  unrar e 'srs.1.2.rar' "${pkgdir}/opt/resample"
  install -D -m755 "${srcdir}/srs.sh" "${pkgdir}/usr/bin/srs"
  install -D -m744 "${pkgdir}/opt/resample/license.txt" "${pkgdir}/usr/share/licenses/resample-bin/license.txt"
  rm "${pkgdir}/opt/resample/license.txt"
}
