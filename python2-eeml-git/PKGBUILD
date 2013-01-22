# Maintainer: TDY <tdy@archlinux.info>

pkgname=python2-eeml-git
pkgver=20130119
pkgrel=1
pkgdesc="A Python package for generating eeml documents"
arch=('any')
url="http://petervizi.github.com/python-eeml/"
license=('GPL3')
depends=('python2-lxml')
makedepends=('git' 'python2-distribute')
provides=('python2-eeml')
conflicts=('python2-eeml')

_gitroot=git://github.com/petervizi/python-eeml
_gitname=python-eeml

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]]; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd $_gitname-build

  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
