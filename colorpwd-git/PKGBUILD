# Maintainer: Jason St. John <jstjohn .. purdue . edu>
pkgname=colorpwd-git
pkgver=20130602
pkgrel=1
pkgdesc='A minimalist Bash wrapper for colorizing the output of $(pwd)'
arch=('any')
url="https://github.com/jrstjohn/colorpwd"
license=('Public Domain')
makedepends=('git')
source=("${pkgname%-git}::git+https://github.com/jrstjohn/${pkgname%-git}.git")
sha1sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git log -1 --format="%cd" --date=short | sed 's|-||g'
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 colorpwd "$pkgdir/usr/bin/colorpwd"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
