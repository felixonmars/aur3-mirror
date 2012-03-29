# Maintainer: Simon Lipp <aur@simon.lipp.name>

pkgname=python3-imaging
pkgver=20120329
pkgrel=1
pkgdesc="PIL 1.1.6 port to Python 3"
arch=('i686' 'x86_64')
url="https://github.com/sloonz/pil-py3k"
license=('custom:pil')
depends=('libjpeg' 'freetype2' 'python')

_gitroot="https://github.com/sloonz/pil-py3k.git"
_gitname="pil-py3k"

build() {
  cd "$srcdir"
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
  else
    git clone $_gitroot || return 1
  fi

  cd pil-py3k
  python setup.py install -O2 --root="$pkgdir" || return 1
}
