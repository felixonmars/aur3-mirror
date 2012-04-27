# Maintainer: Pierrick BRUN <pierrick.brun gmail.com>
pkgname=libreoffice-human-mod
pkgver=3.5.2
pkgrel=1
pkgdesc="An icons pack for libreoffice inspired by human icons"
arch=(any)
url=('http://packages.ubuntu.com/fr/precise/editors/libreoffice-style-human')
license=('GPL')
depends=('libreoffice-common')
conflicts=('libreoffice-faenza-mod')
install=${pkgname}.install
source=('http://dl.dropbox.com/u/1229628/libreoffice_humanMODV3.5.2.zip')
noextract=('libreoffice_humanMODV3.5.2.zip')
md5sums=('a449da6cf488a89dbda2948382173596') 

build() {
LO_DIR=/usr/lib/libreoffice/share/config

mv libreoffice_humanMODV3.5.2.zip images_human.zip
mkdir -p $pkgdir$LO_DIR
cp images_human.zip $pkgdir$LO_DIR

}

