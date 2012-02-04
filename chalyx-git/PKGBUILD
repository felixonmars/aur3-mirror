# Maintainer: Robert McCathie <archaur at rmcc dot com dot au>

pkgname=chalyx-git
pkgver=20100808
pkgrel=1
pkgdesc="Chalyx is a flexible and modular Python client library for XMMS2."
arch=('i686' 'x86_64')
url="http://xmms2.org/wiki/Client:Chalyx"
license=('GPL')
depends=('python>=2.4' 'pyqt>=4' 'python-yaml')
makedepends=('git')
optdepends=('py-libmpdclient2: Chalyx can also act as an extended client library for MPD.')

_gitroot="git://git.xmms.se/xmms2/chalyx-eleusis.git"
_gitname="chalyx-eleusis"

build() {
  cd $startdir/src
  msg "Connecting to git.xmms.se GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git-pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
    cd $_gitname
  fi
  
 make PREFIX=$startdir/pkg/usr install || return 1
 python setup.py install --prefix=$startdir/pkg/usr || return 1
 }
