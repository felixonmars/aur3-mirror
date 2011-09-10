# Maintainer: Kwpolska <kwpolska@kwpolska.tk>

pkgname=dropbox-faenza-dark
pkgver=0.4
pkgrel=3
pkgdesc="Dropbox 0.8x icons for Faenza icon theme -- for dark panels."
install=dropbox-faenza.install
arch=('any')
url="http://gnome-look.org/content/show.php/Ebethron+Faenza+Dropbox+icons?content=134101"
license=('GPL')
depends=('hicolor-icon-theme' 'dropbox')
makedepends=()
provides=()
conflicts=('dropbox-faenza-light' 'dropbox-humanity-dark-icons' 'dropbox-dark-panel-icons' 'dropbox-humanity-icons' 'dropbox-light-panel-icons' 'dropbox-ubuntu-mono-light' 'dropbox-ubuntu-mono-dark')
source=('http://gnome-look.org/CONTENT/content-files/134101-ebethron-faenza-dropbox-icons-0.4.tar.gz')
md5sums=('01784eccc42af65c8b3a71572f95d334')
build() {
  cd ${srcdir}
  tar xzvf ./134101-ebethron-faenza-dropbox-icons-0.4.tar.gz || return 1
  cd ./ebethron-faenza-dropbox-icons-0.4/dark-panel
  install -d ${pkgdir}/usr/share/icons
  cp -r hicolor ${pkgdir}/usr/share/icons
}
