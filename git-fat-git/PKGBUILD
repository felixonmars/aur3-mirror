# Maintainer: matmoser@wu.ac.at
pkgname=git-fat-git
pkgver=0.0.r82.26b6b22
pkgrel=1
pkgdesc='Simple way to handle fat files without committing them to git'
arch=('any')
url='https://github.com/jedbrown/git-fat'
license=('BSD')
depends=('rsync' 'python2')
makedepends=("git")
options=('!emptydirs')
source=("$pkgname"::"git+https://github.com/jedbrown/git-fat.git")
sha512sums=(SKIP)

pkgver() {
	cd "$pkgname"
	# git describe can't describe anything without tags
	printf "0.0.r%d.%s\n" $(git rev-list HEAD --count) $(git rev-parse --short HEAD)
}

package() {
	cd "$pkgname"
	sed -i 's|/usr/bin/env python|/usr/bin/env python2|g' git-fat
	install -D -m755 git-fat "$pkgdir"/usr/bin/git-fat
	install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/"${pkgname}"/LICENSE
}

