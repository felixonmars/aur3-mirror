# Contributor: Giovanni Scafora <giovanni@archlinux.org>

_kernver=`uname -r`
pkgname=microdia-git
pkgver=20100106
pkgrel=1
pkgdesc="Microdia kernel driver for USB webcams with vendor id 0c45"
arch=('i686' 'x86_64')
url="http://groups.google.com/group/microdia"
license=('GPL2')
depends=('kernel26>=2.6.32' 'kernel26<2.6.33')
makedepends=('kernel26-headers>=2.6.32' 'kernel26-headers<2.6.33' 'git' 'ctags')
install=microdia-git.install
source=()
md5sum=()

_gitroot="git://repo.or.cz/microdia.git"
_gitname="microdia"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/$_gitname-build
  cp -r ${srcdir}/$_gitname ${srcdir}/$_gitname-build
  cd ${srcdir}/$_gitname-build

  sed -i -e "s/KERNEL_VERSION = .*/KERNEL_VERSION = ${_kernver}/" Makefile
  make KVER=$_kernver || return 1

  #Install kernel module
  install -D -m644 sn9c20x.ko ${pkgdir}/lib/modules/$_kernver/kernel/drivers/media/video/usbvideo/sn9c20x.ko
  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" ${startdir}/${pkgname}.install || return 1
}
