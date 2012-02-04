# Maintainer: Hans-Kristian Arntzen <maister@archlinux.us>

pkgname=alsa-plugins-rsound-git
pkgver=20110211
pkgrel=1
pkgdesc="RSound output plugin for ALSA"
arch=('i686' 'x86_64')
url="http://www.rsound.org"
license=('GPL')
depends=('rsound' 'alsa-lib')
makedepends=('git')
install=$pkgname.install

_gitroot="git://github.com/Themaister/RSound.git"
_gitrepo="RSound"

build() 
{
  cd $srcdir
  
  if [ -d $_gitrepo ]; then
	  cd $_gitrepo && git pull && cd $srcdir
  else
	  git clone $_gitroot $_gitrepo
  fi

  cd $_gitrepo/patches/alsa
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}

