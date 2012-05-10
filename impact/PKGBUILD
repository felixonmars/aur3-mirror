# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Christoph Siegenthaler <csi@gmx.ch>

pkgname=impact
pkgver=0.7.06.038
pkgrel=1
pkgdesc="An explicit Finite Element Program Suite which simulates dynamic impact events"
arch=('any')
url="http://impact.sourceforge.net/index_us.html"
license=('GPL')
depends=('java-runtime' 'java3d' 'jogl')
source=("http://downloads.sourceforge.net/${pkgname}/Impact-${pkgver}.zip"
        "${pkgname}.desktop"
        "${pkgname}.sh"
        "${pkgname}-nogui.sh")
md5sums=('5f5ab2304d15172855e85c8ed94790a0'
         'a56c63ac90f64f99d40915d2bb6ae090'
         'dc55b48740491319a617d0bf431d178f'
         'dbcf6dc516c81438631a57a509ce03a3')

package() {
  cd "${srcdir}/Impact"

  # Install program files
  mkdir -p "${pkgdir}/opt/${pkgname}/"{,lib}

  install -m644 lib/LogDB.jar lib/mysql-*.jar lib/patbinfree*.jar "${pkgdir}/opt/${pkgname}/lib"
  install -m664 -g users *.conf *.properties "${pkgdir}/opt/${pkgname}"
  install -m755 debug.sh ImpactCluster*.sh ImpactOpt.sh "${pkgdir}/opt/${pkgname}"

  cp -r bin bin_cluster doc examples interfaces lib_cluster \
        *.jnlp *.png COPYING README \
        "${pkgdir}/opt/${pkgname}"

  # Allow users to create files in the 'examples' dir
  chmod 775 "${pkgdir}/opt/${pkgname}/examples"
  chgrp users "${pkgdir}/opt/${pkgname}/examples"

  # Remove unneeded 'CVS' dirs
  find "${pkgdir}/opt/${pkgname}" -name CVS | xargs rm -rf

  # Install launchers
  mkdir -p "${pkgdir}/usr/bin/"
  install -m755 ../${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
  install -m755 ../${pkgname}-nogui.sh "${pkgdir}/usr/bin/${pkgname}-nogui"

  # Install a desktop entry
  install -Dm644 ${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
