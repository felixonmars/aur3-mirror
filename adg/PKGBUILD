# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=adg
pkgver=0.6.4
pkgrel=1
pkgdesc="Automatic Drawing Generation is a set of functions focused on automating the drawing of mechanical parts."
arch=(i686 x86_64)
url="http://adg.entidi.com/"
license=('LGPL')
depends=('gtk3')
makedepends=('gtk-doc')
options=('!libtool')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2"
        {CONTRIBUTING,HACKING,NEWS,README,TODO}.xml) # temporary workaround
md5sums=('5ae5c64c8c155bb0f54f8fc0da0dc574'
         '648ea575a45dab8298eac9bc04bfd3da'
         '6e4a20518e3f383b57443f697897e10e'
         'c1bf239c1c595c471714655418129d55'
         '19ac704486a3ff64b79c0a5d0108dcf7'
         'eec0b070d7ed21609ec50590bac15235')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # missing resources
  install -d docs/gnu
  cp ../*.xml docs/gnu

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
