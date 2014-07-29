# Contributor : Jens Staal <staal1978@gmail.com>
# Package copied from: https://aur.archlinux.org/packages.php?ID=16492
_gitname=tcc
pkgname=$_gitname-static-musl-git
pkgver=20140717.
pkgrel=1
pkgdesc="Tiny C Compiler git mob branch statically compiled against the musl libc"
arch=('i686' 'x86_64')
url="http://bellard.org/tcc/"
license=('LGPL')
options=(docs)
makedepends=(git)
depends=('musl-git') #musl-git is also good
#optdepends=('tcc') # self-hosting compilation
provides=('tcc' 'musl-tcc')
source=('git://repo.or.cz/tinycc.git')
md5sums=('SKIP')
options=(staticlibs)


pkgver() {
  msg "getting TCC mob sources"
  cd   "$srcdir"/tinycc
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

build() {
  rm -rf $srcdir/build # start fresh
  cp -ar ${srcdir}/tinycc $srcdir/build
  cd $srcdir/build

 #sed fixes from Gentoo ebuild, cheers!
  # Don't strip
  sed -i -e 's|$(INSTALL) -s|$(INSTALL)|' Makefile

  msg "Setting up compilation environment"

#  if [ -d /usr/lib/tcc ]; then
#	msg "great! you already got TCC, let's set that as compiler"
#	chmod +x $srcdir/tcc-musl
#	export CC="$srcdir/musl-tcc" #I need to investigate the gcc-musl
#	export CFLAGS="-static"
#  else
#	msg "poor you, no TCC? do not despair you will soon have it :)"
	msg "using the standard GCC musl wrapper"
        export CC="musl-gcc"
	export CFLAGS="-Os -static"
#  fi

  ./configure --prefix=/usr
  make
}

package() {
 cd $srcdir/build
  make tccdir=${pkgdir}/usr/lib/tcc libdir=${pkgdir}/usr/lib \
    mandir=${pkgdir}/usr/share/man bindir=${pkgdir}/usr/bin \
    includedir=${pkgdir}/usr/include \
    docdir=${pkgdir}/usr/share/doc/tcc \
    install

  make clean
  make CFLAGS="-fPIC" libtcc.o || return 1
  ld -shared -soname libtcc.so -o libtcc.so libtcc.o || return 1
  mkdir -p ${pkgdir}/usr/lib/
  install -m755 libtcc.so "${pkgdir}/usr/lib/libtcc.so"
}

