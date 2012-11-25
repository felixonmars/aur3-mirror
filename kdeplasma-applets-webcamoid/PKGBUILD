# Maintainer: ava1ar (mail(dot)avatar(at)gmail(dot)com)

pkgname=kdeplasma-applets-webcamoid
pkgver=3.2.1
pkgrel=1
pkgdesc="Plasmoid to take photos with your webcam"
arch=('any')
url="http://kde-apps.org/content/show.php/Webcamoid?content=144796"
license=('GPL3')
depends=('gstreamer0.10-bad' 'gstreamer0.10-good' 'kdebindings-python2' 'python2')
source=(http://kde-apps.org/CONTENT/content-files/144796-webcamoid.plasmoid)
md5sums=('7d63c55949dfddd2213151e78c780d2d')

package() {
  cd ${srcdir}/Webcamoid
  install -dm755 ${pkgdir}/usr/share/apps/plasma/plasmoids/webcamoid
  cp -R * ${pkgdir}/usr/share/apps/plasma/plasmoids/webcamoid
  install -Dm644 metadata.desktop ${pkgdir}/usr/share/kde4/services/plasmoid-webcamoid.desktop
}
