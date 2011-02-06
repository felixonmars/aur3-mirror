# Maintainer: Philipp Überbacher <murks at lavabit dot com>
pkgname=njl-plugins-git
pkgver=20101223
pkgrel=1
pkgdesc="LADSPA plugins for noise and experimental effects."
arch=('i686' 'x86_64')
url="http://github.com/tialaramex/njl-plugins"
license=('GPL')
depends=('glibc')
makedepends=('git')
provides=('njl-plugins')
conflicts=('njl-plugins')

_gitroot="git://github.com/tialaramex/njl-plugins.git"
_gitname="njl-plugins"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make
}

package(){
  cd "$srcdir/$_gitname-build"

  mkdir -p "${pkgdir}/usr/lib/ladspa/"
  install -m755 *.so "${pkgdir}/usr/lib/ladspa/"
} 
