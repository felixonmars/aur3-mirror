# Maintainer: jsteel <mail at jsteel dot org>
# Contributer: Markus Golser <elmargol@googlemail.com>

pkgname='openclonk-git'
pkgver=20130125
pkgrel=1
pkgdesc="A multiplayer-action-tactic-skill game"
url="http://openclonk.org"
license=('custom')
arch=('i686' 'x86_64')
depends=('mesa' 'sdl_mixer' 'gtk2' 'glew' 'boost')
makedepends=('mercurial' 'boost')
source=('clonk')
conflicts=("openclonk-hg" "openclonk")
provides=("openclonk")

md5sums=('563be0475af4eebac79572c90d917cb2')
#_hgroot='http://hg.openclonk.org'
#_hgrepo='openclonk'
_gitname="openclonk"
_gitroot="git://git.openclonk.org/$_gitname"

build() {
  cd "$srcdir"

#  if [ -d $_hgrepo ]; then
#    cd $_hgrepo
#    hg pull -u
#  else
#    hg clone $_hgroot/$_hgrepo
#    cd $_hgrepo
#  fi
if [ -d ${srcdir}/${_gitname} ] ; then
        msg "Git checkout: Updating existing tree"
	    cd ${_gitname} && git pull origin || return 1
        msg "Git checkout: The local files are updated."
    else
        msg "Git checkout: Cloning"
        git clone ${_gitroot} || return 1
    fi
    msg "GIT checkout: Complete"
  msg "Starting build process"
  
  cd ${srcdir}/${_gitname}
  
  autoreconf -i

  ./configure 'CXX=g++ -std=gnu++0x' --with-gtk=2.0

  make
}

package() {
  install -dm755 "$pkgdir"/usr/share/licenses/$_gitname
  install -Dm755 "$srcdir"/clonk "$pkgdir"/usr/bin/clonk
  install -Dm755 "$srcdir"/$_gitname/clonk "$pkgdir"/usr/share/$_gitname/clonk
  install -Dm644 "$srcdir"/$_gitname/licenses/* "$pkgdir"/usr/share/licenses/$_gitname/

  cp -r "$srcdir"/$_gitname/planet/* "$pkgdir"/usr/share/$_gitname/

  find "$pkgdir"/usr/share/$_gitname/ -type d -exec chmod a+x {} \;
}
