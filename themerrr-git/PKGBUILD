# Maintainer: Dmitry Lavnikevich <haff at midgard dot by>
pkgname=themerrr-git  
pkgver=20120911
pkgrel=1 
pkgdesc="Widget toolkit theme rereader"
url="https://github.com/githaff/themerrr"
arch=('any')
license=('LGPL')
depends=('libx11')
makedepends=('git')

_gitroot="git://github.com/githaff/themerrr.git"
_gitname="themerrr"

build() {
  msg "Connecting to GIT server..."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"

# documentation
  install -D -m644 "README" "${pkgdir}/usr/share/doc/${_gitname}/README" 

# binaries
  install -D -m755 "bin/themerrr" "${pkgdir}/usr/bin/themerrr" 
}
