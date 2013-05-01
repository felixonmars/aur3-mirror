# Maintainer: OK100 <ok100 at lavabit dot com>

pkgname=homepage.py-git
_gitname=homepage.py
pkgver=2013.04.30.g2869d17
pkgrel=1
pkgdesc="Simple homepage generator"
arch=('any')
url="http://ok100.github.io/homepage.py"
license=('WTFPLv2')
depends=('python' 'tidyhtml')
makedepends=('git' 'python-docutils')
source=("git://github.com/ok100/homepage.py.git")
md5sums=("SKIP")

pkgver() {
    cd "${srcdir}/${_gitname}"
    git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

package() {
	cd "$srcdir/$_gitname"
	install -D -m755 "homepage.py" "$pkgdir/usr/bin/homepage.py"

	# install manpage
	rst2man "README.rst" "homepage.py.1"
	install -D -m444 "homepage.py.1" "$pkgdir/usr/share/man/man1/homepage.py.1"
}
