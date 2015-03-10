# Contributor: Rustam Tsurik <rustam.tsurik@gmail.com>

pkgname=raritan-mpc
pkgver=7.0.3.5.60
pkgrel=1
pkgdesc="Standalone multiplatform client for Raritan Dominion KVM-over-IP products"
url="http://www.raritan.com/support/"
license=('custom')
arch=('i686' 'x86_64')

depends=('java-runtime')

options=('!strip')
source=(
  http://support.raritan.com/dominion-kx-ii/version-2.6.0/mpc-installer.MPC_${pkgver}.zip
  'autoinstall.xml'
  'raritan-mpc.desktop'
)
md5sums=('c82d54b0994e1887372c8c992a9314bc'
         '91f900296f5f468f57c107882b4e05a6'
         'c72542f68e79c725469e5dce95efa9a3')
build() {
  cd "${srcdir}"
  java -jar "mpc-installer.MPC_${pkgver}.jar" autoinstall.xml
}

package() {
  mkdir ${pkgdir}/opt
  mv ${srcdir}/raritan-mpc-7.0.1 ${pkgdir}/opt
  mkdir -p ${pkgdir}/usr/share/applications
  cat raritan-mpc.desktop > ${pkgdir}/usr/share/applications/raritan-mpc.desktop
}
