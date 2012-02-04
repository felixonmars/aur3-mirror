# Maintainer: TDY <tdy@gmx.com>

pkgname=newt
pkgver=0.52.12
pkgrel=1
pkgdesc="A programming library for color text mode, widget based user interfaces"
arch=('i686' 'x86_64')
url="https://fedorahosted.org/newt/"
license=('GPL')
depends=('popt' 'slang' 'tcl')
makedepends=('python2')
source=(https://fedorahosted.org/releases/n/e/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('51b04128d9e1bf000fa769c417b74486')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i Makefile.in \
      -e 's,-ltcl8.4,-ltcl8.5,g' \
      -e 's,$(SHCFLAGS) -o,$(LDFLAGS) &,g' \
      -e 's,-g -o,$(CFLAGS) $(LDFLAGS) -o,g' \
      -e 's,-shared -o,$(CFLAGS) $(LDFLAGS) &,g' \
      -e 's,instroot,DESTDIR,g' \
      -e 's,  make ,  $(MAKE) ,g'
  sed -i 's,/usr/bin/install,install,' po/Makefile
  ./configure --prefix=/usr --with-gpm-support --with-tcl --enable-nls
  make PYTHONVERS=python2.7
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
