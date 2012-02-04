# Maintainer: Tianjiao Yin <ytj000@gmail.com>

pkgname=cppreference-git
pkgver=20111011
pkgrel=1
pkgdesc="A complete reference for the features in the C++ Standard Library. "
arch=('any')
url="http://en.cppreference.com/"
license=('CCPL:cc-by-sa')
makedepends=('git' 'libxslt' 'httrack')
provides=(cppreference)
conflicts=(cppreference)

_gitroot="git://github.com/p12tic/cppreference-doc.git"
_gitname="cppreference-doc"

build() {
  cd $srcdir
  msg "Connecting to the GIT server...."
  
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  
  msg "GIT checkout done"
  msg "Starting make..."

  git clone $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build

  mkdir output
  make source
  make
}

package() { 
  mkdir -p $pkgdir/usr/share/doc
  mv $srcdir/${_gitname}-build/output $pkgdir/usr/share/doc/cppreference
} 

# vim:set ts=2 sw=2 et:
