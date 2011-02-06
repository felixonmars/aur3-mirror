# Contributor: Maurizio Porrato <maurizio.porrato@gmail.com>
pkgname=python-cyclone-git
pkgver=20101030
pkgrel=2
pkgdesc="Twisted based Tornado framework clone"
license=('apache')
url="http://github.com/fiorix/cyclone"
_gitroot="git://github.com/fiorix/cyclone.git"
_gitname="python-cyclone"
arch=(any)
conflicts=('python-cyclone')
provides=('python-cyclone')
makedepends=('git' 'python2-distribute')
depends=('twisted')

build() {
  cd ${srcdir}/

  msg "Connecting to the GIT server...."
  if [[ -d ${srcdir}/${_gitname} ]] ; then
    cd ${_gitname}
    git pull origin
    msg "The local files are updated..."
  else
    git clone ${_gitroot} ${_gitname}
  fi
    
  msg "GIT checkout done."

  msg "Starting make for: ${pkgname}"
    
  if [[ -d ${srcdir}/${_gitname}-build ]]; then
    msg "Cleaning the previous build directory..." 
    rm -rf ${srcdir}/${_gitname}-build
  fi

  git clone ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
    
  cd ${srcdir}/${_gitname}-build
        
  msg "Starting configure..."

  python2 setup.py install --optimize=1 --prefix=/usr --root=$startdir/pkg  --optimize=1 || return 1
}
