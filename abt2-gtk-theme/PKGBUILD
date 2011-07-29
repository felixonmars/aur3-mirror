# Contributor: Coolaman <coolaman@free.fr>

pkgname=abt2-gtk-theme
pkgver=0.4
pkgrel=1
pkgdesc="A simple and fast blue theme for Xfce"
arch=('i686' 'x86_64')
url="http://coolaman.free.fr/?Artwork:Abt2"
license=('GPL')
depends=('gtk-engine-murrine-git' 'gtk-engines' 'gtk-xfce-engine')
source=("http://coolaman.free.fr/downloads/${pkgname}-$pkgver.tar.gz")
md5sums=('4f5b97ffce6dde8827918c84b5281f6a')

build() {
  cd ${srcdir}/${pkgname}
  install -d ${pkgdir}/usr/share/themes/${pkgname}
  cp -rf * ${pkgdir}/usr/share/themes/${pkgname} || return 1
}

