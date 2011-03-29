# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=sge2d
pkgver=0.9.1
pkgrel=1
pkgdesc="SDL Game Engine is a platform independent 2d game programming framework for c/c++ programmers with a focus on easy porting and API calls."
arch=(i686 x86_64)
url="http://agnosent.com/wolfcms/open-source/sge2d"
license=('GPL')
depends=('sdl_mixer' 'sdl_image')
makedepends=('doxygen')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('298d710ea64b05306afcb2e8bb9885a5')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # let's build shared libs instead of static
  sed -e "s|-rs|-shared -Wl -o|" \
      -e "s|\(CFLAGS=.*\)|\1 -fPIC|" \
      -e "s|(AR)|(CC) \$(SGELDFLAGS)|" \
      -e "s|libsge.a|libsge.so|" \
      -i Makefile
  find . -name Makefile -exec sed -i "s|\([^ ]*\)/libsge.a|-L\1/ -lsge|g" {} \;

  # sgestate requires sga object
  sed -i "s|CC.*OBJSGESTATE)|& \$(OBJSGA)|" tools/Makefile

  # remove useless -L flag
  sed -i "s_sdl-config --libs_&|sed 's+-L/usr/lib ++'_" setup.linux

  # let demos loads data from the right path
  for _demo in `find demos -mindepth 1 -maxdepth 1 -type d`; do
    sed -i "s|\".*\(data.d\"\)|\"/usr/share/sge2d/demos/${_demo/*\//}/\1|g" \
        $_demo/*.c*
  done;

  ./configure
  make {,demos,doc}
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # shared library
  install -Dm755 libsge.so "$pkgdir/usr/lib/libsge.so.$pkgver"
  ln -s /usr/lib/libsge.so.$pkgver "$pkgdir/usr/lib/libsge.so.${pkgver%%.*}"
  ln -s /usr/lib/libsge.so.$pkgver "$pkgdir/usr/lib/libsge.so"

  # headers
  install -d "$pkgdir/usr/include/$pkgname"
  install -Dm644  include/* "$pkgdir/usr/include/$pkgname"

  # docs
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -a doc/* "$pkgdir/usr/share/doc/$pkgname"
  rm "$pkgdir/usr/share/doc/$pkgname/"{Doxyfile,default.Makefile,html/installdox}

  # tools
  install -Dm755 tools/sga "$pkgdir/usr/bin/$pkgname-tool-sga"
  install -Dm755 tools/sgestate "$pkgdir/usr/bin/$pkgname-tool-sgestate"

  # demos
  for _demo in `find demos -perm 755 -type f`; do
    install -Dm755 $_demo "$pkgdir/usr/bin/$pkgname-demo-${_demo/*\//}"
  done
  for _demo in `find demos -name data.d`; do
    install -Dm644 $_demo "$pkgdir/usr/share/$pkgname/$_demo"
  done
  ln -s /usr/share/$pkgname/demos/font "$pkgdir/usr/share/$pkgname/demos/events"

  # pixmap
  install -Dm644 logo/$pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
