# created 16:30:17 - 22/08/09
# Maintainer: Frikilinux <frikilinux at gmail.com>

pkgname=dnetstats
pkgver=1.2.6
pkgrel=4
pkgdesc="Graphic monitor for the network. Show the network stats and the netmap"
arch=('i686' 'x86_64')
url="http://qt-apps.org/content/show.php/DNetStats?content=107467"
license=('GPL')
depends=('qt4')
makedepends=('automoc4')
source=("http://www.qt-apps.org/CONTENT/content-files/107467-DNetStats-v${pkgver}-release.tar.bz2"
	dnetstats.desktop)
sha256sums=('590521d60731e7066855151c4a9545322c8f6031aaec766fae4ad19a6a95cb57'
            'cb7f4e91eedab12e24b3783c7295425af86277f6080072b4d9aa59dbb37cab17')

build() {

  cd ${srcdir}/DNetStats-v${pkgver}-release
  /usr/bin/moc-qt4 src/dialogimpl.h -o moc_dialogimpl.cpp
  /usr/bin/moc-qt4 thread.h -o moc_thread.cpp
  /usr/bin/moc-qt4 shutthread.h -o moc_shutthread.cpp
  /usr/bin/moc-qt4 netthread.h -o moc_netthread.cpp
  qmake-qt4
  make
}

package() {
  cd ${srcdir}/DNetStats-v${pkgver}-release
  install -Dm755 mythread ${pkgdir}/usr/bin/dnetstats
  install -Dm644 ../dnetstats.desktop ${pkgdir}/usr/share/applications/dnetstats.desktop
  install -Dm644 resource/wp.png ${pkgdir}/usr/share/pixmaps/wp.png

}