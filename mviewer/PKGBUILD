# Maintainer: Ernie Brodeur (ebrodeur@ujami.net)>
pkgname=mviewer
pkgver=0.9.1
pkgrel=1
pkgdesc="A simple web-based Administration and Management Tool for MongoDB."
url="https://github.com/Imaginea/mViewer"
arch=('any')
license=('Apache 2.0')
depends=('java-runtime')
source=("https://github.com/downloads/Imaginea/mViewer/mViewer-v${pkgver}.tar.gz"
"mviewer.rc"
"mviewer.rc.conf")
noextract=("mViewer-v${pkgver}.tar.gz")

md5sums=('4a1394567b44c7ad19fe888bd3b2e7b0'
         '4e7a35766271ca6397e4f40197ad4a78'
         '498fdda421dad60f6226e1fb3b23cf09')

build() {
  cd "${srcdir}"
  mkdir -p ${pkgname}-${pkgver}
  tar xfz mViewer-v${pkgver}.tar.gz -C ${pkgname}-${pkgver}
  cd ${pkgname}-${pkgver}
  # we don't need either of these files and it cuts down on noise.
  rm start_mViewer.bat
  rm mViewer.properties
}

package() {
  mkdir -p ${pkgdir}/opt/${pkgname}
  cd "${srcdir}/${pkgname}-${pkgver}"
  cp * ${pkgdir}/opt/${pkgname}
  install -Dm 755 "$startdir/mviewer.rc" "${pkgdir}/etc/rc.d/mviewer"
  install -Dm 755 "$startdir/mviewer.rc.conf" "${pkgdir}/etc/conf.d/mviewer"
}
