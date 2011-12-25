# Maintainer: Panagiotis Mavrogiorgos (pmav99) <> (gmail)

pkgname=nuitka-git
pkgver=20111225
pkgrel=1
pkgdesc="A Python compiler to machine-code."
arch=(any)
url="http://www.nuitka.net/blog/"
license=('GPL3')
depends=('python2')
optdepends=()
makedepends=('git') 
provides=('nuitka')
conflicts=('nuitka')
replaces=()
backup=()
options=(!emptydirs)

_gitroot='http://git.nuitka.net/Nuitka.git'
_gitname='nuitka'

build()
{
  if [ -d "${srcdir}/${_gitname}" ]
  then
    msg "Updating local repository..."
    cd "${srcdir}/${_gitname}"
    git pull origin develop || return 1
    msg "The local files are updated."
  else
    git clone --branch develop ${_gitroot}/ ${_gitname}
  fi
  msg "git checkout done or server timeout"

  if [ -d "${srcdir}/${_gitname}-build" ]
  then
    rm -rf "${srcdir}/${_gitname}-build"
  fi
  cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"

  msg "Starting make..."
}

package()
{
  # Install using setup.py
  cd "${srcdir}/${_gitname}-build"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
