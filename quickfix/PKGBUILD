# Maintainer: Louis R. Marascio <lrm@fitnr.com>
# Maintainer: Andy Melnikov <andy.melnikov@gmail.com>

pkgname=quickfix
pkgver=1.13.3
pkgrel=5
pkgdesc="A full-featured open source FIX engine, currently compatible with the FIX 4.0-5.0 spec."
arch=('i686' 'x86_64')
url="http://www.quickfixengine.org"
license=('custom:The QuickFIX Software License')
options=('!libtool')
depends=('libxml2' 'boost-libs')
makedepends=('boost')
source=(http://prdownloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('1e569a32107ecfc1de9c15bdcb5dc360')

build() {
  cd "$srcdir/$pkgname"
  P=$(python2-config --includes | grep -Po '/\S+' | head -n 1)
  export LDFLAGS=-lboost_system
  export LIBS=-lboost_system
  ./configure --prefix=/usr --with-python=$P || return 1
  make || return 1
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/lib/python2.7/site-packages"
  make PYTHON_SITE_PACKAGES="$pkgdir/usr/lib/python2.7/site-packages" DESTDIR="$pkgdir/" install || return 1
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm $pkgdir/usr/lib/python2.7/site-packages/_quickfix.{dylib,so}
  ln -s /usr/lib/libquickfix_python.so "$pkgdir/usr/lib/python2.7/site-packages/_quickfix.so" 
  ln -s /usr/lib/libquickfix_python.so "$pkgdir/usr/lib/python2.7/site-packages/_quickfix.dylib"
}

# vim:set ts=2 sw=2 et:
