# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Rasmus Pank Roulund <rasmus@pank.eu>
pkgname=python2-parakeet-git
pkgver=g02e2c9d
pkgrel=1
pkgdesc="Runtime compiler for numerical Python"
arch=('i686' 'x86_64')
url="http://www.parakeetpython.com/"
license=('BSD')
depends=('python2-dsltools-git')
makedepends=()
checkdepends=('python2-nose')
optdepends=('LLVM: C backend'
            'python2-llvmpy-git: C backend')
source=("$pkgname"::'git://github.com/iskandr/parakeet.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's+-+.+'g|cut -c9-
}

check() {
  cd "$pkgname"
  nosetests2 -w test/
}

package() {
  cd "$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
