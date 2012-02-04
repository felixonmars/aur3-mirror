# Contributor: Zuhair Kamar <held_zaikos@hotmail.com>

pkgname=kaid
pkgver=7.0.0.7
pkgrel=1
pkgdesc="XLink-Kai: Evolution, Global Network Gaming"
arch=('i686')
url="http://www.teamxlink.co.uk/"
license=('unknow')
install=${pkgname}.install
source=("http://www.teamxlink.co.uk/binary/${pkgname}-${pkgver}-linux-x86.tar.gz?downloadID=103&grab=Download")
md5sums=('1a44d8062a36cb0a97f79bab29905d59')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-linux-x86"
  mv kaid.conf /etc/kaid.conf || return 1
  mv kaid /usr/bin || return 1
}





