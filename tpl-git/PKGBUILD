# Maintainer: Romain Porte <microjoe@mailoo.org>

pkgname=tpl-git
pkgver=r31.9883535
pkgrel=1
pkgdesc="Write template-based source code on stdout."
arch=('any')
url="http://git.microjoe.org/tpl/about/"
license=('GPL')
groups=()
depends=('python' 'python-jinja')
makedepends=('git')
checkdepends=()
optdepends=()
provides=('tpl')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('git+http://git.microjoe.org/tpl')
noextract=()
md5sums=('SKIP')

_gitname='tpl'

pkgver() {
	cd "$srcdir/$_gitname"
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "$_gitname"

	python setup.py install --root="$pkgdir/"

	install -Dm644 COPYING \
		${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

	install -Dm644 tpl.1 \
		${pkgdir}/usr/share/man/man1/tpl.1
}
