# Maintainer: Hilton Medeiros <medeiros.hilton AT gmail DOT com>

pkgname=gdb-archer-fb-git
pkgver=20101128
pkgrel=1
pkgdesc="The GNU Debugger with C++ debugging improvements (Archer Fedora branch)"
arch=('i686' 'x86_64')
url="http://sourceware.org/gdb/wiki/ProjectArcher"
license=('GPL3')
depends=('ncurses' 'expat' 'python2')
makedepends=('git' 'texinfo')
backup=('etc/gdb/gdbinit')
provides=('gdb')
conflicts=('gdb')
options=('!libtool')
install=gdb-archer-fb-git.install

_gitroot="git://sourceware.org/git/archer.git"
_gitname="archer"
_gitbranch="archer-jankratochvil-fedora15"

build() {
  cd $srcdir

  if [ -d "$_gitname" ] ; then
    pushd $_gitname && git pull origin
    popd
    msg "The local files are updated."
  else
    git clone $_gitroot
    msg "Git clone done or server timeout."
  fi

  rm -rf $_gitname-build
  cp -r $_gitname $_gitname-build
  cd $_gitname-build
  git checkout -tb $_gitbranch origin/$_gitbranch

  msg "Git checkout done."
  msg "Starting make..."

  mkdir build && cd build

  ../configure --prefix=/usr --disable-nls \
    --with-system-readline \
    --with-system-gdbinit=/etc/gdb/gdbinit \
    --with-python=/usr/bin/python2
  make
}

package() {
  cd $srcdir/$_gitname-build/build
  make DESTDIR=$pkgdir install

  install -dm755 $pkgdir/etc/gdb
  touch $pkgdir/etc/gdb/gdbinit

  # Resolve conflicts with binutils
  rm ${pkgdir}/usr/include/{ansidecl,bfd,bfdlink,dis-asm,symcat}.h
  rm ${pkgdir}/usr/lib/{libbfd,libiberty,libopcodes}.a
  rm ${pkgdir}/usr/share/info/{bfd,configure,standards}.info
}
