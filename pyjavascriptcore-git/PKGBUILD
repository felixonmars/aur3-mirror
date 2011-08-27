# Maintainer: sbillaudelle <stein@cream-project.org>

pkgname=pyjavascriptcore-git
pkgver=0.3
pkgrel=2
pkgdesc="Use Python to tap into the whole power of WebKit."
arch=('i686' 'x86_64')
url="https://launchpad.net/pyjavascriptcore"
license=('LGPL')
depends=('cython')
makedepends=('git')
source=()
md5sums=()

_gitroot="git://github.com/cream/PyJavascriptCore.git"

build()
{
  git clone $_gitroot $srcdir/ || return 1
  cd $srcdir/

  python setup.py install --prefix=/usr --root="$pkgdir" || return
}
