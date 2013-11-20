## Maintainer: Rasmus <rasmus@gmx.us>
pkgname='python2-seaborn-git'
pkgver=0.r235.d2237ee
pkgrel=1
pkgdesc="Improved matplotlib for statistical data visualization"
arch=('i686' 'x86_64')
url="http://stanford.edu/~mwaskom/software/seaborn/"
license=('BSD')
depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-matplotlib'
         'python2-pandas' 'python2-statsmodels' 'python2-patsy' 'python2-scikit-learn'
         'python2-husl-git' 'python2-moss-git')
source=("$pkgname"::'git://github.com/mwaskom/seaborn.git')
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
