# Original contributor: Martin Cigorraga Muller <msx (@) archlinux (dot) us>

pkgname=kdeplasma-applets-miniweb
pkgver=1.0.2
pkgrel=1
pkgdesc="Miniweb is a Plasma widget that embeds a WebView."
arch=('x86_64')
url='https://plasma-miniweb.googlecode.com/'
license=('GPL')
depends=('kdebase-workspace')
source=("https://plasma-miniweb.googlecode.com/files/plasma-miniweb-$pkgver.plasmoid")
md5sums=('b648f7729935f0b4a913c3b5429e6b31')
install='miniweb.install'

build() {
  msg "Unzipping..."
}

package() {
  cd "${srcdir}/"
  install_folder="${pkgdir}/usr/share/apps/plasma/plasmoids/miniweb/"
  install -d "${install_folder}"/contents/code
  install -d "${install_folder}"/contents/code/helpers
  install -m644 metadata.desktop "${install_folder}"
  install -m644 contents/code/main.py "${install_folder}"/contents/code/
  install -m644 contents/code/helpers/* "${install_folder}"/contents/code/helpers/
    install -Dm644 metadata.desktop \
    "${pkgdir}"/usr/share/kde4/services/plasma-applet-miniweb.desktop 
}
