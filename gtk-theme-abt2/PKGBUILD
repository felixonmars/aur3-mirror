# Mainteiner: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Coolaman <coolaman@free.fr>

pkgname=gtk-theme-abt2
pkgver=0.4
pkgrel=1
pkgdesc="A simple and fast blue theme for Xfce"
arch=('i686' 'x86_64')
url="http://coolaman.free.fr/?Artwork:Abt2"
license=('GPL')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk-xfce-engine')
source=("http://coolaman.free.fr/downloads/abt2-gtk-theme-$pkgver.tar.gz")
md5sums=('4f5b97ffce6dde8827918c84b5281f6a')

package() {
  cd ${srcdir}/abt2-gtk-theme
  install -d ${pkgdir}/usr/share/themes/${pkgname}
  cp -rf * ${pkgdir}/usr/share/themes/${pkgname} || return 1
}

