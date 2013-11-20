## Maintainer: Rasmus <rasmus@gmx.us>
pkgname='python2-hush'
pkgver=v2.0.2.1.gdef7a17
pkgrel=1
pkgdesc="Python port of HUSL "
arch=('i686' 'x86_64')
url="https://github.com/boronine/pyhusl/"
license=('MIT')
depends=('python2')
source=("$pkgname"::'git://github.com/boronine/pyhusl.git')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	# Use the tag of the last commit
	local ver="$(git describe --tags)"
	printf "%s" "${ver//-/.}"
}

package() {
  cd "$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
