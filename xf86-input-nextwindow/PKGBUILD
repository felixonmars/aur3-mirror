# Contributor: Riccardo Ferrazzo <f.riccardo87@gmail.com>
pkgname=xf86-input-nextwindow
pkgver=0.3.1
pkgrel=1
pkgdesc="Nextwindow Xorg input driver for nwfermi"
arch=('i686')
url="https://launchpad.net/nwfermi"
license=('GPL')
depends=('utouch-grail' 'xorg-server' 'deb2targz')
install=
source=(https://launchpad.net/~djpnewton/+archive/xf86-input-nextwindow/+files/${pkgname}_${pkgver}_i386.deb)
noextract=(${pkgname}_${pkgver}_i386.deb)
md5sums=('2f42cff1371b5171233d8c2b9532840a')

build() {
  cd "$srcdir"
  deb2targz ${pkgname}_${pkgver}_i386.deb
  tar -C $pkgdir -xzvf ${pkgname}_${pkgver}_i386.tar.gz
  rm -r $pkgdir/usr/lib/pkgconfig
}

