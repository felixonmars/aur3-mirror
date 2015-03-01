pkgname=git-flow
pkgver=r2.15aab26
pkgrel=2
pkgdesc="Tool to partially automate the git flow branching model"
arch=('any')
url="https://github.com/nvie/git-flow"
license=('BSD')
depends=('git')
makedepends=('git')
source=("git-flow::git+https://github.com/nvie/gitflow")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
    cd git-flow

    chmod +x ./contrib/gitflow-installer.sh
	INSTALL_PREFIX=$pkgdir/usr/bin ./contrib/gitflow-installer.sh
}
