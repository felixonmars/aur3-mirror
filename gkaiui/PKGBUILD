# Contributor: Zuhair Kamar <held_zaikos@hotmail.com>

pkgname=gkaiui
pkgver=1
pkgrel=1
pkgdesc="User Interface for XLink-Kai: Evolution, Global Network Gaming"
arch=('i686')
url="http://www.teamxlink.co.uk/"
license=('unknow')
install=${pkgname}.install
source=("http://www.teamxlink.co.uk/downloads/${pkgname}-preview.tar.bz2?downloadID=400&grab=Download")
md5sums=('e929a6d92fa714ee11236b3a334dbe54')

build() {
  cd "${srcdir}/${pkgname}"
  mkdir /usr/local/share/gkaiui/
  cp -r pixmaps /usr/local/share/gkaiui || return 1
  mv gkaiui /usr/bin || return 1
}






