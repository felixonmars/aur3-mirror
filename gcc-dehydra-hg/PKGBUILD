# Maintainer

pkgname=gcc-dehydra-hg
pkgver=20100428
pkgrel=2
pkgdesc="Dehydra is a GCC-plugin representing C++ types and variables as JavaScript objects."
arch=(i686 x86_64)
url="https://developer.mozilla.org/en/Dehydra"
license=('GPL2+')
depends=('gcc' 'xulrunner')
makedepends=('mercurial')
provides=('gcc-dehydra')

_hgroot="http://hg.mozilla.org/rewriting-and-analysis/dehydra/"
_hgname="dehydra"

build() {
  cd "$srcdir"
  msg "Connecting to hg server...."

  if [ -d $_hgname ] ; then
    cd $_hgname && hg pull $_hgroot || return 1
    msg "The local files are updated."
  else
    hg clone $_hgroot || return 1
  fi

  msg "hg checkout done"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgname-build"
  hg clone "$srcdir/$_hgname" "$srcdir/$_hgname-build"
  cd "$srcdir/$_hgname-build"

  # FIXME: how to get the version of xulrunner ?
  ./configure \
    --js-headers=/usr/include/xulrunner-1.9.2 \
    --js-libs=/usr/lib/xulrunner-1.9.2 \
    || return 1
  make || return 1
  make check_dehydra || return 1
  #make DESTDIR=$pkgdir install || return 1

  # install part
  install -d $pkgdir/usr/lib/dehydra
  for lib in $srcdir/$_hgname-build/*.so
  do
    install -m644 $lib -t $pkgdir/usr/lib/dehydra
  done

  install -d $pkgdir/usr/share/dehydra/libs
  for js in $srcdir/$_hgname-build/libs/*.js
  do 
    install -m644 $js -t $pkgdir/usr/share/dehydra/libs
  done

  install -d $pkgdir/usr/share/dehydra/libs/unstable
  for js in $srcdir/$_hgname-build/libs/unstable/*.js
  do
    install -m644 $js -t $pkgdir/usr/share/dehydra/libs/unstable
  done

  pushd $pkgdir/usr/lib/dehydra
  ln -s ../../share/dehydra/libs .
  popd
}
