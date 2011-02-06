# Contributor: Jack <nim901@gmail.com>
pkgname=limon
pkgver=0.1
pkgrel=1
pkgdesc="limon is a graphical front end to limon site"
url="http://isotop.dotgeek.org/"
depends=('libgnome' 'gtk')
source=(http://isotop.dotgeek.org/$pkgname-$pkgver.tar.gz)
md5sums=(77f3793b4d529a687dd0ca7a861f35bc)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
make
make DESTDIR=$startdir/pkg install
}
