# Maintainer: Tianyi Cui <tianyicui@gmail.com>
pkgname=mtd-utils-git
pkgver=20090613
pkgrel=1
pkgdesc="Utilities for manipulating memory technology devices, such as flash memory, Disk-On-Chip, or ROM. Includes mkfs.jffs2, a tool to create JFFS2 (journaling flash file system) filesystems."
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.linux-mtd.infradead.org/"
makedepends=('git')
depends=('lzo2')

_gitroot=git://git.infradead.org/mtd-utils.git
_gitname=mtd-utils

build() {
  cd "$srcdir"

  msg "Connecting to $_gitroot..."
  if [ -d $_gitname ]; then
    cd $_gitname && git pull origin && cd ..
  else
    git clone $_gitroot
  fi

  rm -rf $_gitname-build
  cp -R $_gitname $_gitname-build
  cd $_gitname-build

  make
  make DESTDIR="$pkgdir" install

  return 0
}
