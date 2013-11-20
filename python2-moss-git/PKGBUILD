## Maintainer: Rasmus <rasmus@gmx.us>
pkgname='python2-moss-git'
pkgver=0.r121.3950d95
pkgrel=4
pkgdesc="Assorted utilities for neuroimaging and cognitive science."
arch=('i686' 'x86_64')
url="https://github.com/mwaskom/moss/"
license=('BSD')
Depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-matplotlib'
         'python2-pandas' 'python2-statsmodels' 'python2-patsy'
         'python2-scikit-learn' 'python2-husl-git' 'python2-seaborn-git')
source=("$pkgname"::'git://github.com/mwaskom/moss.git')
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
