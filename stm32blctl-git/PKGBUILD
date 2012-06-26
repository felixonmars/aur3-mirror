# Contributor: Lebed Dmitry <lebed.dmitry@gmail.com>
pkgname=stm32blctl-git
pkgver=20120626
pkgrel=1
pkgdesc="Open source tool used to program flash for the STM32 ARM processors using the ST bootloader."
arch=('i686' 'x86_64')
url="http://github.com/dlebed/stm32blctl"
license=('GPLv3')
makedepends=('subversion')

_gitroot="https://github.com/dlebed/stm32blctl.git"
_gitname="master"

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

  cd "$srcdir/$_gitname"

  make
}

package() {
  cd "$srcdir/$_gitname"
  install -m 755 -d $pkgdir/usr/sbin
  install -m 755 stm32blctl $pkgdir/usr/sbin/stm32blctl
}
