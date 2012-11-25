# Contributor: 
pkgname=tomboy-git-git
pkgver=20121027
pkgrel=1
pkgdesc="Git(g) addin for Tomboy"
arch=(any)
url="https://github.com/hb/tomboy-git-addin"
license=(unknown)
depends=('tomboy' 'gitg')
makedepends=('git')
source=()
md5sums=() #generate with 'makepkg -g'

_gitroot="https://github.com/hb/tomboy-git-addin.git"
_gitname="tomboy-git-addin"

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
  msg "Installing..."
  cd $_gitname
  make
}

package() {
  cd $srcdir/$_gitname
  install -d $pkgdir/usr/lib/tomboy/addins
  install Git.dll $pkgdir/usr/lib/tomboy/addins/
}


# vim:set ts=2 sw=2 et:

