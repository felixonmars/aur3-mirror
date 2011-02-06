#Contributor: Lorenzo Nizzi Grifi Gargiolli <lorenzo.nizzi.grifi@gmail.com>
pkgname=dike
pkgver=4.2.4
pkgrel=1
pkgdesc="Software provided by InfoCamere S.p.a. to digitally sign the documents"
arch=('i686')
url="https://www.firma.infocert.it"
license=('custom')
makedepends=('deb2targz')
depends=('qt4' 'pcsclite' 'ccid')
source=(https://www.firma.infocert.it/software/$pkgname-$pkgver-i386.deb)
md5sums=('79463ba792f4632cced1a55fe01b970b')

build() {
  deb2targz $pkgname-$pkgver-i386.deb
  tar xvfz $pkgname-$pkgver-i386.tar.gz
  cp -a etc/ usr/ ../pkg -r
 }

