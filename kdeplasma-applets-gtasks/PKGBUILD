# Original contributor: Martín Cigorraga Müller <msx (@) archlinux (dot) us>

pkgname=kdeplasma-applets-gtasks
pkgver=1.4
pkgrel=1
pkgdesc="This widget wraps GMail Tasks in your desktop."
arch=('x86_64')
url='http://kde-apps.org/content/show.php/Google%2BGmail+Tasks?content=140790'
license=('GPL')
depends=('kdebase-workspace' 'qt-mobility')
makedepends=('git' 'cmake' 'automoc4')
source=("http://kde-apps.org/CONTENT/content-files/140790-gtasks-1.4.plasmoid")
md5sums=('42e85c73955f56bcfc7b3a4e180ed41f')
screenshot="http://i.imgur.com/nGN6kRf.png"
install='gtasks.install'

build() {
  msg "Unzipping..."
}

package() {
  cd "${srcdir}/"
  install_folder="${pkgdir}/usr/share/apps/plasma/plasmoids/org.orbitalibre.google-tasks/"
  install -d "${install_folder}"/contents/{code,data,images}
  install -m644 metadata.desktop "${install_folder}"
  install -m644 contents/code/* "${install_folder}"/contents/code/
  install -m644 contents/data/* "${install_folder}"/contents/data/
  install -m644 contents/images/* "${install_folder}"/contents/images/
  install -Dm644 metadata.desktop \
    "${pkgdir}"/usr/share/kde4/services/plasma-applet-gtasks.desktop 
}



