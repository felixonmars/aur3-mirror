# Contributor: Riccardo Ferrazzo <f.riccardo87@gmail.com>
pkgname=nwfermi
pkgver=0.6.1.0
pkgrel=2
pkgdesc="The driver for the NextWindow 1950/3000 Touch Screens"
arch=('i686')
url='https://launchpad.net/nwfermi'
license=('GPL')
depends=('dkms' 'make' 'xf86-input-nextwindow')
makedepends=('deb2targz')
install=${pkgname}.install
source=(http://launchpad.net/nwfermi/trunk/0.6.1/+download/${pkgname}-${pkgver}_i386.deb\
  udev.patch)
noextract=(${pkgname}-${pkgver}_i386.deb)
md5sums=('2f66c79c022ce140206a873abec7db95'
         '0c62774eab45651d321faa8f88b09ea8')

build() {
  cd "$srcdir"
  deb2targz ${pkgname}-${pkgver}_i386.deb
  tar -C $pkgdir -xzvf ${pkgname}-${pkgver}_i386.tar.gz
  rm -r $pkgdir/etc/init
  patch -p 1 $pkgdir/etc/udev/rules.d/40-nw-fermi.rules udev.patch
}