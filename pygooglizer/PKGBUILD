# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>

pkgname=pygooglizer
pkgver=0.1
pkgrel=1
pkgdesc="Googlizer clone written in python"
arch=('any')
url="https://github.com/ggilestro/pygooglizer"
license=('GPL3')
depends=('gtk2')
source=(http://gilest.ro/download/software/$pkgname-$pkgver.tar.gz)
md5sums=('b1045a2a7f8f416bb2703040a5cdcc26' )

build() {
  
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/{applications,pygooglizer}
  mkdir -p $pkgdir/usr/share/icons/scalable/apps
  
  cd "$srcdir/"
  sed -i 's/python/python2/g' pygooglizer.py
  
  cp pygooglizer $pkgdir/usr/bin
  cp pygooglizer.desktop $pkgdir/usr/share/applications/
  cp pygooglizer.py $pkgdir/usr/share/pygooglizer/
  cp pygooglizer.svg $pkgdir/usr/share/icons/scalable/apps/
}
