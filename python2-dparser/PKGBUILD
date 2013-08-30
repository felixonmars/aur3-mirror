# Maintainer: perlawk
# derived from dparser 1.30 by Alain Kalker
pkgname=python2-dparser
_pkgname=dparser
pkgver=1.30
pkgrel=2
pkgdesc="A scannerless GLR parser generator based on the Tomita algorithm, with python2 version"
arch=('i686' 'x86_64')
url="http://dparser.sourceforge.net/"
license=('BSD')
depends=('glibc' 'gc')
conflicts=('dparser')
source=("http://prdownloads.sourceforge.net/$_pkgname/d-$pkgver-src.tar.gz"
'setup.py')
# bsdtar doesn't grok upstream tarball which has duplicate files in it
noextract=(d-$pkgver-src.tar.gz)

build() {
  cd "$srcdir"
  # Need to extract source tarball with GNU tar
  tar xzf "d-$pkgver-src.tar.gz"
  cd "$srcdir/d"
  make D_USE_GC=1
  cd "$srcdir/d/python"
  cp "$startdir"/setup.py .
  sed -i 's/which python/which python2/;' Makefile
  make
}

package() {
  cd "$srcdir/d"
  make D_USE_GC=1 PREFIX="$pkgdir/usr" install
  install -d -m755 "$pkgdir/usr/share"
  mv "$pkgdir/usr/man" "$pkgdir/usr/share/"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
  install -Dm644 index.html "$pkgdir/usr/share/doc/$pkgname/index.html"
  cd "$srcdir"
  for f in \
      d/tests/ansic.test.g d/tests/python.test.g d/verilog/verilog.g \
      d/make_dparser.cat d/manual.html d/faq.html \
      d/dparse.h d/dparse_tables.h d/dsymtab.h; do
    install -Dm644 $f "$pkgdir/usr/share/doc/$pkgname/$f"
  done

  cd "$srcdir/d/python"
   python2 setup.py install --root="$pkgdir/" --optimize=1

}

# vim:set ts=2 sw=2 et:
md5sums=('04b4e5ff4834d64e348deb294f655e7f'
         'e3922eeb46b640ec8349a12ac0877696')
