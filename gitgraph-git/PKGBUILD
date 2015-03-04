# Maintainer: Romain Porte <microjoe@mailoo.org>

pkgname=gitgraph-git
pkgver=0.1.r0.g7491c7e
pkgrel=1
pkgdesc="Generate Github-like activity graph for local git repositories."
arch=('i686' 'x86_64')
url="http://git.microjoe.org/gitgraph/about"
license=('AGPL')
groups=()
depends=('python' 'python-pygit2')
makedepends=('git')
checkdepends=()
optdepends=()
provides=('gitgraph')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('git+http://git.microjoe.org/gitgraph')
noextract=()
md5sums=('SKIP')

_gitname='gitgraph'

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

	install -Dm644 gitgraph.1 \
		${pkgdir}/usr/share/man/man1/gitgraph.1
}
