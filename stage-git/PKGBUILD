# Mantainer: Attilio Priolo <attilio.priolo@gmail.com>
# Contributor: Renato Garcia <fgar.renato@gmail.com>
# Contributor: Yannick Poirier <contact@yannickpoirier.fr>

pkgname=stage-git
pkgver=20130205
pkgrel=1
pkgdesc='Fast and scalable robot simulator'
arch=('any')
url='http://playerstage.sourceforge.net'
license=('GPL')
depends=('fltk' 'libpng' 'player')
conflicts=('stage' 'stage3')
makedepends=('cmake')
source=('player-3.0.2.patch')
md5sums=('5379843508e3ca3a43f2e42fe240e99f')

_gitroot="https://github.com/rtv/Stage.git"
_gitname="stage"

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
  
  msg "Patching..."

  cd ${srcdir}/${_gitname}
  patch -p1 -i $srcdir/player-3.0.2.patch 
  
  msg "Starting make..."
  
  rm -rf ${srcdir}/${_gitname}-build
  cp -r ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
  cd ${srcdir}/${_gitname}-build

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make

}

package() {
  cd ${srcdir}/${_gitname}-build
  make DESTDIR="${pkgdir}" install
}


