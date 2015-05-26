# Maintainer: Wilfried Fauvel <wilfried.fauvel at gmail>

pkgname=olv
pkgver=1.3.1
pkgrel=1
pkgdesc='Otros log viewer/parser with loading logs from remote servers (sftp, smb etc). Supporting log filters and automatic log highlightings'
arch=('any')
url='https://code.google.com/p/otroslogviewer/'
license=('Apache')
depends=('jre7-openjdk')
source=("http://downloads.sourceforge.net/project/otroslogviewer/v${pkgver}/${pkgname}-${pkgver}.zip")
md5sums=('47165b4590d92c54a83a7a715cae8b3e')

package()
{
  # Install
  install -m755 -d "${pkgdir}/opt/${pkgname}"
  mv -i "${srcdir}/olv-${pkgver}/"* "${pkgdir}/opt/${pkgname}"
  chmod 755 "${pkgdir}/opt/${pkgname}/lib/"*
}

