# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: mar77i <mysatyre@gmail.com>
pkgname=python-funcy-git
pkgver=0.5.6.20131015
pkgrel=2
pkgdesc="A collection of fancy functional tools focused on practicality for the python language."
arch=(any)
url="https://github.com/Suor/funcy"
license=(custom)
groups=()
depends=(python-setuptools)
makedepends=('git')
_gitname=funcy
source=("${_gitname}::git+https://github.com/Suor/${_gitname}.git")
sha256sums=(SKIP)

pkgver() {
	cd "$srcdir/${_gitname}"
	local ver=$(python3 setup.py -V)
	printf "%s.%s" "${ver//-/.}" "$(date +%Y%m%d)"
}

build() {
  cd "$srcdir"
  rm -rf "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname"
  python3 setup.py install --prefix=/usr --root="$pkgdir"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
