# Galculator with XDG patch
# contributor: hadzhimurad ustarkhan - hmurad dot ust at gmail dot com

pkgname=galculator-xdg
pkgbase=galculator
pkgver=1.3.4
pkgrel=3
pkgdesc="GTK2 scientific calculator."
arch=('i686' 'x86_64')
url="http://galculator.sourceforge.net/"
license=('GPL')
conflicts='galculator'
depends=('libglade')
makedepends=('intltool')
provides=('galculator')
conflicts=('galculator')
source=(http://downloads.sourceforge.net/galculator/$pkgbase-$pkgver.tar.bz2
        $pkgbase-$pkgver-xdg.patch)
md5sums=('d30e6fbf5947bb1c873bc9d5a21046f1' 
         'cf05e0b0af03dac648835347c55c64f9')

build() {
  cd "$srcdir/galculator-$pkgver"

  patch -Np1 -i "$srcdir/galculator-$pkgver-xdg.patch"

  ./configure LDFLAGS="-lm" --prefix=/usr || return 1

  make || return 1

  make DESTDIR="$pkgdir" install || return 1
}
