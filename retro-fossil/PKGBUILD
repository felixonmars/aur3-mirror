pkgname=retro-fossil
pkgver=11
pkgrel=4
pkgdesc="Retro is a portable, stack-based language with roots in Forth."
arch=('i686' 'x86_64')
url="http://retroforth.com"
license=('Public Domain')
makedepends=('fossil' 'docutils')
provides=('retro')
install=
changelog=$pkgname.changelog
source=()
md5sums=()

_fossil_repo="http://rx-core.org/rx.fossil"
_fossil_name="rx"

build() {
  
  [ -e "$startdir/$_fossil_name"  ] || ( cd $startdir; fossil clone $_fossil_repo $_fossil_name )
  [ -e "$srcdir/$_fossil_name"    ] || ( cd $srcdir; ln -s $startdir/$_fossil_name $_fossil_name )
  [ -e "$srcdir/$pkgname-$pkgver" ] || ( mkdir $srcdir/$pkgname-$pkgver; )

  cd $srcdir/$pkgname-$pkgver

  if [ -e "_FOSSIL_" ] ; then
    fossil pull
  else
    fossil open $srcdir/$_fossil_name
  fi

  sed '/define GLOBAL/ s#/local##' -i src/vm/retro.c 

  msg "creating tools"
  make tools
  msg "creating vm"
  make c
  msg "creating image"
  make image
  if [[ "$CARCH" == "x86_64" ]]; then
    msg "recreating 64-bit vm"
    make CFLAGS=-DRX64 c
    ./convert
  fi
  msg "generating documentation"
  make update-library-docs
  make docs


}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/{lib/retro,bin,share/{man/man1,retro,licenses/retro,doc/retro/library}}
  
  gzip -c9 doc/retro.1 > $pkgdir/usr/share/man/man1/retro.1.gz
  xz -c9 LICENSE > $pkgdir/usr/share/licenses/retro/LICENSE.xz
  xz -c9 src/core.rx > $pkgdir/usr/share/retro/core.rx.xz
  install -m755 retro $pkgdir/usr/bin/retro

  if [[ "$CARCH" == "x86_64" ]]; then
    install -m644 retroImage64 $pkgdir/usr/share/retro
  else
    install -m644 retroImage $pkgdir/usr/share/retro
  fi

  cp doc/*.html $pkgdir/usr/share/doc/retro
  cp doc/library/*.html $pkgdir/usr/share/doc/retro/library
  cp src/library/* $pkgdir/usr/lib/retro

}

# vim:set ts=2 sw=2 et:
