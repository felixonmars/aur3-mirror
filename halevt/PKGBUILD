# Contributor: Felix Hanley <felix@seconddrawer.com.au>
pkgname=halevt
pkgver=0.1.6.2
pkgrel=1
pkgdesc="A daemon that executes arbitrary commands on HAL events"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/halevt/"
license=('GPL')
depends=('hal' 'boolstuff' 'libxml2')
makedepends=('pkgconfig')
optdepends=('pmount')
install=halevt.install
source=(http://savannah.nongnu.org/download/halevt/$pkgname-$pkgver.tar.gz
  halevt.rc)
md5sums=('e5e81ba1ffa9f2230bf80f8b3da4f166'
  '0e3c09a7a3f47205812eecde766a437c')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib  --localstatedir=/var
  make || return 1
  make DESTDIR="$pkgdir/" install
#  rm ${startdir}/pkg/usr/share/info/dir
  install -m755 -D $startdir/halevt.rc $startdir/pkg/etc/rc.d/halevt || return 1
  mkdir -p $startdir/pkg/usr/share/$pkgname/examples
  cp $srcdir/$pkgname-$pkgver/examples/*.{xml,sh} $startdir/pkg/usr/share/$pkgname/examples/
}

# vim:set ts=2 sw=2 et:
