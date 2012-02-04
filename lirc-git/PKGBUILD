# $Id: PKGBUILD 89030 2010-08-28 07:10:45Z tpowa $
# Maintainer of extra pkg : Paul Mattal <paul@archlinux.org>
# Mantainer of this -git version, Berseker <berseker86 at gmail dot com>
# PKGBUILD made by adapting extra PKGBUILD to -git

pkgname=lirc-git
pkgver=20101030
pkgrel=2
_kernver=2.6.36-ARCH
pkgdesc="Linux Infrared Remote Control kernel modules for stock arch kernel - git version"
arch=('i686' 'x86_64')
url="http://www.lirc.org/"
license=('GPL')
depends=('lirc-utils>=0.8.6' 'kernel26>=2.6.35')
makedepends=('help2man' 'kernel26-headers>=2.6.35' 'git')
replaces=('lirc+pctv')
options=('!makeflags')
install=$pkgname.install
source=()

_gitroot="git://lirc.git.sourceforge.net/gitroot/lirc/lirc"
_gitname="lirc"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

   # configure
   # see http://bugs.gentoo.org/301321
   #  patch -p0 -i ../kernel-2.6.33.patch
   #  patch -Np0 -i ../kernel-2.6.35.patch
./autogen.sh
        ./configure --enable-sandboxed --prefix=/usr \
                --with-driver=all --with-kerneldir=/usr/src/linux-${_kernver}/ \
              	--with-moduledir=/lib/modules/${_kernver}/kernel/drivers/misc \
                --with-transmitter

        # disable parallel and bt829
        # because of incompatibility with smp systems
        sed -i -e "s:lirc_parallel::" -e "s:lirc_bt829::" \
                Makefile drivers/Makefile drivers/*/Makefile tools/Makefile

        # disable lirc_gpio due to brokeness of kernel 2.6.23
        sed -i -e "s:lirc_gpio::" \
                Makefile drivers/Makefile drivers/*/Makefile tools/Makefile

        # build
        cd drivers
        make
        make DESTDIR=${pkgdir} install

        # set the kernel we've built for inside the install script
        sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
                ${startdir}/${pkgname}.install
}
