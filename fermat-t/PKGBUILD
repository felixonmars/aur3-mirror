# Maintainer: perlawk

pkgname=fermat-t
pkgver=3.0
pkgrel=1 
pkgdesc="The FermaT Transformation System is an industrial strength program transformation system targeted at reverse engineering, program comprehension and migration between programming languages."
url="http://www.cse.dmu.ac.uk/~mward/fermat.html"
arch=( 'i686' 'x86_64')
license=('GPL') 
depends=('perl' 'perl-bit-vector')
install=install.fermaT
source=( "http://www.cse.dmu.ac.uk/~mward/fermat3.tar.gz")

prepare() {
  cd $srcdir/fermat3
  sed -i 's!^FermaT=.*$!FermaT=/usr/lib/fermaT!' DOIT.sh DOIT.bash
}

build() {
  cd $srcdir/fermat3
  make
}

package() {
  cd $srcdir/fermat3
  dest="$pkgdir/usr/lib/fermaT"
  mkdir -p $dest
  install -m755 -d $dest/bin $dest/example $dest/scm $dest/slib $dest/config/Set $dest/Linux
  install -m755 -t "$dest/bin" bin/*
  install -m644 -t "$dest/example" example/*
  install -m755 -t "$dest/scm" scm/*
  install -m755 -t "$dest/slib" slib/*
  install -m755 -t "$dest/Linux" Linux/scm*
  install -m755 -t "$dest/config" config/*scm config/*pl config/*pm config/*pro
  install -m755 -t "$dest/config/Set" config/Set/*pm
  install -m755 -t "$pkgdir/usr/lib/fermaT" DOIT.sh DOIT.bash
}
md5sums=('12fdecc40879bd25057f6cced3c1bd19')
