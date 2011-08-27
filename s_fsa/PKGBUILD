# Maintainer: Bart Verhoeven <nepherte at archlinux dot us>

pkgname=s_fsa
pkgver=0.50
pkgrel=1
pkgdesc="finite state utilities"
arch=('i686' 'x86_64')
license=('GPL')
depends=('perl' 'tk')
makedepends=()
url="http://www.eti.pg.gda.pl/katedry/kiw/pracownicy/Jan.Daciuk/personal/fsa.html"
source=("ftp://ftp.pg.gda.pl/pub/software/xtras-PG/fsa/fsa_$pkgver.tar.gz"
        "Makefile.patch")
md5sums=('954d28636b7a5577f39c7979373d2124'
         '193b109ac2ca962fc0fac4e8381e3c62')

build() {
    cd $srcdir/$pkgname

    # Required for other programs like alpino
    patch -p0 < $srcdir/Makefile.patch

    # Build program
    make
}

package() {
  cd $srcdir/$pkgname

  # Create necessary directories
  install -d -m755 $pkgdir/usr/bin
  install -d -m755 $pkgdir/usr/share/man/man{1,5}
  install -d -m755 $pkgdir/usr/share/emacs/site-lisp/s_fsa
  install -d -m755 $pkgdir/usr/lib/s_fsa

  make PREFIXDIR=$pkgdir/usr \
      BINDIRFILE=/usr/bin \
      MANDIR=$pkgdir/usr/share/man \
      DICTDIR=$pkgdir/usr/lib/s_fsa \
      DICTDIRFILE=/usr/lib/s_fsa \
      LISPDIR=$pkgdir/usr/share/emacs/site-lisp/s_fsa \
      TCLMACQDIR=$pkgdir/usr/lib/s_fsa \
      TCLMACQDIRFILE=/usr/lib/s_fsa \
      TCLMACQBINDIRFILE=/usr/bin \
      PREP_FCONF= \
      install
}
