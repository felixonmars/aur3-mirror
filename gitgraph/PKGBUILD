# Maintainer: Romain Porte <microjoe@mailoo.org>

pkgname=gitgraph
pkgver=v0.1
pkgrel=1
pkgdesc="Generate Github-like activity graph for local git repositories"
arch=('i686' 'x86_64')
url="http://microjoe.eu/"
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
source=('git+http://git.microjoe.eu/gitgraph')
noextract=()
md5sums=('SKIP')

_gitname='gitgraph'

pkgver() {
	cd "$srcdir/$_gitname"
	git describe --tags | sed 's/-/./g'
}

package() {
	cd "$_gitname"

	python setup.py install --root="$pkgdir/"

	install -Dm644 COPYING \
		${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

	install -Dm644 gitgraph.1 \
		${pkgdir}/usr/share/man/man1/tpl.1
}
