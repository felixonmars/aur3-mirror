# Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=gadmin-bind
pkgver=0.2.5
pkgrel=1
pkgdesc="A GTK+ Application to help administrate BIND"
arch=('i686' 'x86_64')
url="http://gadmintools.flippedweb.com/index.php?option=com_content&task=view&id=14&Itemid=33"
license=('GPL')
depends=('gtk2' 'bind')
optdepends=('gksu: Graphical SU Support')
source=("http://mange.dynalias.org/linux/${pkgname}/${pkgname}-${pkgver}.tar.gz" "${pkgname}-menu" "${pkgname}.desktop")
md5sums=('203bdafd26990c8b8c6f0649b9549b14'
         '4e49a8f30153afe2234c5cc985f9cdd0'
         '253258ed96363727dbc30400f9beef80')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
