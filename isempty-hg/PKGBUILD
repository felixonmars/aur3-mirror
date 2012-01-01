# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_name=isempty
pkgname=$_name-hg
pkgver=1
pkgrel=1
pkgdesc='Check file emptyness.'
arch=('i686' 'x86_64')
url='http://hg.last-exile.org/isempty/'
license=('GPL3')
provides=('isempty')
conflicts=('isempty')

_hgtrunk=http://hg.last-exile.org/isempty/
_hgmod=$_name

build() {
  cd "$srcdir"

  if [ -d "$_hgmod/.hg" ]; then
    cd "$_hgmod"
    hg pull -u
  else
    hg clone "$_hgtrunk" "$_hgmod"
    cd "$_hgmod"
  fi

  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_hgmod"
  make DESTDIR="$pkgdir/" install
}

