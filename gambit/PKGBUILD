# Maintainer: Remy Lefevre <lefevreremy@gmail.com>

pkgname=gambit
pkgver=13.0.2
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A set of software tools for doing computation on finite, noncooperative games. "
url="http://www.gambit-project.org/doc/index.html"
license=("GPL")
depends=(wxgtk)
makedepends=('gcc')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/${pkgname}13/$pkgver/$pkgname-$pkgver.tar.gz)

prepare()
{
  cd "$srcdir/$pkgname-$pkgver"
}

build()
{
  cd "$srcdir/$pkgname-$pkgver"
  if test "$CARCH" == x86_64; then
    ./configure --disable-enumpoly prefix=/usr
  else	  
    ./configure prefix=/usr
  fi
  make || return 1
}
package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
md5sums=('cd730a5cea78986bf1fd64e66f54de67')
