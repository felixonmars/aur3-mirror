# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Rasmus Pank Roulund <rasmus@pank.eu>
pkgname=python2-dsltools-git
pkgver=0.r28.caa8247
pkgrel=1
pkgdesc="Helpers for DSL construction in Python "
arch=('i686' 'x86_64')
url="https://github.com/iskandr/dsltools"
license=('BSD')
depends=('python2-numpy')
source=("$pkgname"::'git://github.com/iskandr/dsltools.git')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
        printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
