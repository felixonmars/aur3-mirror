# Maintainer: Wilfried Fauvel <wilfried.fauvel at gmail>

pkgname=chainsaw
pkgver=release_20060302
pkgrel=2
pkgdesc='Chainsaw v2 is a companion application to Log4j written by members of the Log4j development community.'
arch=('any')
url='http://logging.apache.org/chainsaw/index.html'
license=('Apache')
depends=('jre7-openjdk')
source=("http://logging.apache.org/${pkgname}/webstart/${pkgname}-bundle.zip")
md5sums=('7a1c78cc86f72a2caf5036567af83c63')

package()
{
  # Install
  install -m755 -d "${pkgdir}/opt/${pkgname}"
  mv -i "${srcdir}/"*.jar "${pkgdir}/opt/${pkgname}"
  awk '{gsub("-classpath ", "-classpath /opt/chainsaw/", $0); gsub(":", ":/opt/chainsaw/", $0); print}' "${srcdir}/${pkgname}.sh" > "${pkgdir}/opt/${pkgname}/${pkgname}.sh"
  chmod +x "${pkgdir}/opt/${pkgname}/${pkgname}.sh"
}

