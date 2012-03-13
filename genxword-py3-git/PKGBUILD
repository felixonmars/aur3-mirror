#Maintainer: "riverrun <alovedalongthe AT gmail DOT com>"

pkgname=genxword-py3-git
pkgver=20120313
pkgrel=1
pkgdesc="Crossword generator written in python"
url="https://github.com/riverrun/genxword"
arch=('any')
license=('GPLv3')
depends=('python' 'python-cairo')
makedepends=('git')
options=('zipman')

_gitroot="git://github.com/riverrun/genxword.git"
_gitname="genxword"

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
}

package() {
  cd "${srcdir}/$_gitname-build"
  python setup.py install --root=$pkgdir/ --optimize=1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/genxword-py3-git/LICENSE
  install -Dm644 man/genxword-py3.6 $pkgdir/usr/share/man/man6/genxword-py3.6
}
