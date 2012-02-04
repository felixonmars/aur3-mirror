# Maintainer: Sven-Hendrik Haase

pkgname="sysprof-git"
pkgver=20100713
pkgrel=1
pkgdesc="A sampling CPU profiler that uses a Linux kernel module to profile the entire system"
arch=('i686' 'x86_64')
url="http://www.daimi.au.dk/~sandmann/sysprof/"
license=('GPL')
makedepends=('git')
source=()
md5sums=()
conflicts=('sysprof' 'sysprof-module')
provides=('sysprof' 'sysprof-module')
depends=('libglade' 'kernel26>=2.6.31')
install=sysprof.install

_gitroot=git://git.gnome.org/sysprof
_gitname=sysprof

build() {
  cd ${srcdir}
  msg "Connecting to git.gnome.org GIT server..."

  if [ -d ${srcdir}/$_gitname ]; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir/$_gitname"
  _BFDVER=`ldconfig -p | grep bfd | perl -ne 'if(/libbfd-(\S+).so/){print $1;}'`
  ./autogen.sh --prefix=/usr || return 1
  sed -i "s/-lbfd/-lbfd-${_BFDVER}/" configure

  # making/installing app
  make || return 1
  make DESTDIR="$pkgdir" install || return 1

  # making/installing kernel module
  cd module
  make || return 1
  _kernver=`pacman -Q kernel26 | cut -d . -f 3 | cut -f 1 -d -`
  _KERNELVER=$(uname -r)
  cd "$srcdir/$_gitname/module"
  install -D -m644 sysprof-module.ko $pkgdir/lib/modules/$_KERNELVER/misc/sysprof-module.ko
}
# vim: set sw=2 ts=2 et:
