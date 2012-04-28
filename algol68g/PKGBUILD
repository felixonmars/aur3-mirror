# Contributor: karolina.lindqvist@kramnet.se

pkgname=algol68g
pkgver=2.3.9
pkgrel=1
pkgdesc="Algol 68 Genie, an Algol 68 compiler-interpreter"
arch=(i586 i686)
url="http://www.xs4all.nl/~jmvdveer/algol.html"
license=(GPL)
depends=(gsl plotutils)
optdepends=('postgresql-libs: for postgresql support')

source=(http://jmvdveer.home.xs4all.nl/algol68g-$pkgver.tar.gz
        options.patch 
	plotutils.patch plotutils-filldefault.patch
	http://www.xs4all.nl/~jmvdveer/a68gdoc.pdf)

build() {
  cd "$srcdir/$pkgname-$pkgver"
#  patch -b -p0 <../../options.patch
  patch -b -p0 <../../plotutils.patch
#  patch -b -p0 <../../plotutils-filldefault.patch
#  sed -i -e "s/prescott/$CARCH/g" ./configure
  CFLAGS="$CFLAGS -O3 -fomit-frame-pointer -funroll-loops" ./configure --prefix=/usr
#--enable-$CARCH 
  make
  make DESTDIR="$pkgdir" docdir="/usr/share/doc/$pkgname" install
  # Install documentation .pdf file
  install $srcdir/a68gdoc.pdf $pkgdir/usr/share/doc/$pkgname
}
md5sums=('24f53cabf31345cb66f07cd7c562718d'
         'dba10afacb7d3273fdf4bf87fddfb245'
         '397ae032a32195f46318ee7a79c503ed'
         '9e90b0e24b94e864a6a00bfa75b3b46d'
         '072531be2af34f19d160eab20214fc7b')
