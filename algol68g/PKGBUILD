# Contributor: Karro <karolina.lindqvist@kramnet.se>

pkgname=algol68g
pkgver=1.18.0
pkgrel=1
pkgdesc="Algol68 interpreter"
arch=(i586 i686)
url="http://www.xs4all.nl/~jmvdveer/algol.html"
license=('custom')
depends=(gsl plotutils)
optdepends=('postgresql-libs: for postgresql support')

source=(http://www.xs4all.nl/~jmvdveer/$pkgname-$pkgver.tgz
        options.patch comment.extension.patch standardprelude.patch configure.patch
	a68g.1
	plotutils-filldefault.patch
	http://www.xs4all.nl/~jmvdveer/a68gdoc.pdf)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -b -p0 <../../options.patch || return 1
  patch -b -p0 <../../configure.patch || return 1
  patch -b -p0 <../../comment.extension.patch || return 1
#  patch -b -p0 <../../plotutils.patch || return 1
  patch -b -p0 <../../standardprelude.patch || return 1
  patch -b -p0 <../../plotutils-filldefault.patch || return 1
  sed -i -e "s/prescott/$CARCH/g" ./configure || return 1
  ./configure -O5 --threads -incdir=/usr/include -bindir=/usr/bin -libdir=/usr/lib
  sed -i -e 's/^USR_BIN=.*$/USR_BIN=$(DESTDIR)\/usr\/bin/' \
         -e 's/^man_dir=.*$/man_dir=$(DESTDIR)\/usr\/share\/man\/man1\//' makefile 
  make || return 1
  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/man/man1
  install -d $pkgdir/usr/share/doc/$pkgname
  install -d $pkgdir/usr/share/doc/$pkgname/demo
  # Due to a bug in mk17
  if [ ! -f doc/man1/a68g.1 ]; then \
      mkdir doc; \
      mkdir doc/man1; \
      cp ../../a68g.1 doc/man1/;
  fi
  make DESTDIR="$pkgdir" install || return 1
  # There is nothing of value in doc right now
  #cp doc/* $pkgdir/usr/share/doc/$pkgname
  # Install demo programs
  cp demo/* $pkgdir/usr/share/doc/$pkgname/demo
  # Install documentation .pdf file
  install $srcdir/a68gdoc.pdf $pkgdir/usr/share/doc/$pkgname
  install -m755 -d $startdir/pkg/usr/share/licenses/$pkgname
  install -m644 ./copying.txt $pkgdir/usr/share/licenses/$pkgname
}

md5sums=('8ae33b7882c63c0b313aca5b3614fa52'
         'dba10afacb7d3273fdf4bf87fddfb245'
         '1e49e626b059b6efd5f8111638fb2e8d'
         '0853dfe8abe4f92ea2338e7d1184de18'
         'e6337871081ebe2907441aa59c34c879'
         'd456e03311cc7baede0411cbc343a237'
         '9e90b0e24b94e864a6a00bfa75b3b46d'
         '072531be2af34f19d160eab20214fc7b')
