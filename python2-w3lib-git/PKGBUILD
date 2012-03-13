# Maintainer: Apkawa <apkawa@gmail.com>
pkgname="python2-w3lib-git"
pkgver=20110925
pkgrel=1
pkgdesc="A fast high-level scraping and web crawling framework - development version."
arch=('i686' 'x86_64')
license=('BSD')
url="https://github.com/scrapy/w3lib/"
depends=('python2')
makedepends=('git')
provides=('python2-w3lib')
conflicts=('python2-w3lib')
options=(!emptydirs)

_gitroot=https://github.com/scrapy/w3lib.git
_gitrepo=w3lib

build() {
  cd ${srcdir}

  if [ -d ${_gitrepo} ]; then
    (cd ${_gitrepo} && git pull)
  else
    git clone ${_gitroot}
    cd ${_gitrepo}
  fi

  # installation
  cd $srcdir/$_gitrepo
  python2 setup.py install --root=$pkgdir --optimize=1 || return 1
}
