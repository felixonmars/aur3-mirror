# Contributor: Apkawa <apkawa@gmail.com>

pkgname=guimge-git
pkgver=20091019
pkgrel=1
pkgdesc="gtk picture uploader to various imagehostings written on python"
arch=('i686' 'x86_64')
url="http://code.google.com/p/uimge/"
license=('GPL')
makedepends=('git')
depends=('python' 'uimge-git' 'pygtk' 'gtk')
source=( )
md5sums=( )

_gitname="guimge"
_gitroot="git://github.com/Apkawa/guimge.git"
build() {
  cd ${srcdir}
  msg "Connecting to $_gitroot GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
  cd $_gitname && git pull origin
  msg "The local files are updated."
  else
  git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cp -r ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
  cd ${srcdir}/${_gitname}-build/
  
  #install guimge gui
  python setup.py build -f install -f --root $pkgdir --prefix=/usr || return 1
}
