pkgname=fermion
pkgver=20111218
pkgrel=1
pkgdesc="A sandbox module for python. Based on catbox. Used on lpms."
arch=('i686')
url='http://hadronproject.org/'
license=('GPL')
makedepends=('git')
depends=('python2')

_gitroot="git://gitorious.org/hadron/fermion.git"
_gitname="fermion"

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

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

}

package() {
  cd "$srcdir/$_gitname-build"
  sed -i 's/python/python2/' setup.py
  python2 setup.py build
  mkdir -p $pkgdir/usr/lib/python2.7/site-packages
  cp build/lib.linux-i686-2.7/fermion.so $pkgdir/usr/lib/python2.7/site-packages/fermion.so
}
