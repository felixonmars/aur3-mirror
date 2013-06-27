# Mainteiner: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Coolaman <coolaman@free.fr>

pkgname=gtk-theme-abt
pkgver=0.5
pkgrel=1
pkgdesc="A simple and fast blue theme for Xfce"
arch=('i686' 'x86_64')
url="http://coolaman.free.fr/?Artwork:Abt"
license=('GPL')
depends=('gtk-xfce-engine' 'gtk-engines')
source=("http://coolaman.free.fr/downloads/abt-gtk-theme-$pkgver.tar.gz")
md5sums=('8d2fa2001083cccf2e7d9318d30f0db4')

package() {
  cd ${srcdir}/abt-gtk-theme-$pkgver
  install -d ${pkgdir}/usr/share/themes/${pkgname}
  cp -rf * ${pkgdir}/usr/share/themes/${pkgname} || return 1
}

