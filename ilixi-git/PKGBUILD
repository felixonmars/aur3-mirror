#Maintainer :	Georgios Tsalikis	<anaphaxeton somewhere near tsalikis and a net>

pkgname=ilixi-git
pkgver=20121219
pkgrel=1
pkgdesc="ilixi is an application framework for DirectFB, written in C++, with embedded Linux systems in mind."
arch=('i686' 'x86_64')
url="http://ilixi.org"
license="LGPL3"
depends=('directfb' 'libsigc++' 'libxml2')     #****** For compositing to work one actually needs 'directfb-multi' ******
makedepends=('git')
provides=('ilixi=0.10')
conflicts=('ilixi')
install=
source=()


_gitroot="git://git.directfb.org/git/directfb/libs/ilixi.git"
_gitname="ilixi"

build() {
  msg "Connecting to git.directfb.org GIT server...."

  if [[ -d "${srcdir}/${_gitname}" ]] ; then
    cd ${_gitname}
    git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done"

  # Remove old -build
  rm -rf "${srcdir}/${_gitname}-build"

  cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  ./autogen.sh --prefix=/usr  --with-examples 
  
  msg "Starting make..."
  
  make 

}

package() {
	cd "${srcdir}/${_gitname}-build"
	make DESTDIR=${pkgdir} install
}
