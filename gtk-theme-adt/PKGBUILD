# Mainteiner: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Coolaman <coolaman@free.fr>

pkgname=gtk-theme-adt
pkgver=0.2
pkgrel=1
pkgdesc="A simple and clean dark theme for Xfce"
arch=('i686' 'x86_64')
url="http://coolaman.free.fr/?Artwork:Adt"
license=('GPL')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk-xfce-engine' )
source=("http://coolaman.free.fr/downloads/adt-gtk-theme-$pkgver.tar.gz")
md5sums=('78c4fde8a82a45eb521f78f68b54d195')

package() {
  cd ${srcdir}/adt-gtk-theme-${pkgver}
  install -d ${pkgdir}/usr/share/themes/${pkgname}
  cp -rf * ${pkgdir}/usr/share/themes/${pkgname} || return 1
}

