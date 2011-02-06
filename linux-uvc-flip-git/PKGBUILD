# Maintainer: Adam Vogt <vogt.adam@gmail.com> # adapted to the fliped git repo
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Giovanni Scafora <linuxmania@gmail.com>
# Contributor: Robert Emil Berge <filoktetes@linuxophic.org>

_kernver=`uname -r | sed 's/-ARCH//'`
pkgname=linux-uvc-flip-git
pkgver=20081117
pkgrel=1
pkgdesc="Linux driver for USB Video Class devices, patched to flip the video"
arch=('i686' 'x86_64')
url="http://linux-uvc.berlios.de"
license=('GPL2')
depends=("kernel26")
makedepends=('git')
install=linux-uvc.install
source=()
md5sums=()

_gitroot="git://github.com/dfu/linux-uvc_flip.git"
_gitname="linux-uvc_flip"

build() {
  cd $startdir/src
  msg "Connecting to GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -r $startdir/src/$_gitname-build
  cp -r $startdir/src/$_gitname $startdir/src/$_gitname-build
  cd $startdir/src/$_gitname-build

  make  || return 1
  #Install kernel module as uvcvideo-flip
  install -D -m644 uvcvideo.ko $pkgdir/lib/modules/`uname -r`/\
    kernel/drivers/media/video/uvc/uvcvideo-flip.ko
  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='`uname -r`'/" $startdir/*.install
}
