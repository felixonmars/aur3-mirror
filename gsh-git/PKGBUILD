# Contributor: Alexander Tsamutali <astsmtl@yandex.ru>

pkgname=gsh-git
pkgver=20101124
pkgrel=1
pkgdesc="A tool to aggregate several remote shells into one."
arch=('i686' 'x86_64')
url="http://guichaz.free.fr/gsh/"
license=('GPL')
depends=('python2')
makedepends=('git')
provides=('gsh')
conflicts=('gsh')

_gitroot="git://repo.or.cz/gsh.git"
_gitname="gsh"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout."
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  python2 setup.py install --root="$pkgdir"
}
