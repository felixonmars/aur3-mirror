# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=python2-unidecode-git
_pyname=Unidecode
_gitname=unidecode
pkgver=0.04.17.r0.g50dc686
pkgrel=1
pkgdesc='ASCII transliterations of Unicode text  (git version)'
arch=('any')
url='http://pypi.python.org/pypi/Unidecode/'
license=('GPL')
depends=('python2')
makedepends=('git')
options=(!emptydirs)
provides=('python2-unidecode')
conflicts=('python2-unidecode')
source=("git+http://www.tablix.org/~avian/git/${_gitname}.git")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${_gitname}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^release.//g'
}

# vim:set ts=2 sw=2 et:
