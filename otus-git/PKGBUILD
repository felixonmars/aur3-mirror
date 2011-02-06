# Contributor: Jordy van Wolferen <jordz@archlinux.us>

pkgname=otus-git
pkgver=20081216
pkgrel=1
pkgdesc="otus is an Atheros IEEE 802.11n USB Linux driver"
url="http://wireless.kernel.org/en/users/Drivers/otus"
arch=('i686' 'x86_64')
license=('ICS')
depends=()
makedepends=('git' 'kernel-headers')
install=otus-git.install
source=()
md5sums=()

_gitroot="git://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/otus.git"
_gitname="otus"

build() 
{
  cd ${srcdir}
  msg "Connecting to git.kernel.org GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
  	cd $_gitname && git pull origin
  msg "The local files are updated."
  else
	  git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cp -r ${srcdir}/$_gitname ${srcdir}/$_gitname-build
  cd ${srcdir}/$_gitname-build

  make || return 1
  
  cd ${srcdir}/$_gitname-build/OAL/Otus/Linux

  mkdir -p $startdir/pkg/lib/modules/$(uname -r)/net/
  install -m644 arusb_lnx.ko $startdir/pkg/lib/modules/$(uname -r)/net/  
} 

