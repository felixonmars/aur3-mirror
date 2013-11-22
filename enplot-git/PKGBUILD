# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Rasmus Pank Roulund <rasmus@pank.eu>
pkgname=enplot-git
pkgver=0.r78.ccf60f2
pkgrel=1
pkgdesc="One-line plotting tool using Python and Matplotlib"
arch=('i686' 'x86_64')
url="https://github.com/jrjohansson/enplot"
license=('GPL')
depends=('python' 'python-matplotlib')
source=("$pkgname"::'git://github.com/jrjohansson/enplot.git')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
        printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
