# Maintainer: Maximilian Köhl <linuxmaxi@googlemail.com>
pkgname=uberwriter-git
pkgver=r23.4547c77
pkgrel=1
pkgdesc="It's a simple Markdown editor that offers a lot of features."
arch=(any)
url="http://uberwriter.wolfvollprecht.de/"
license=('GPL')
depends=('python-gtkspellcheck' 'python-gobject' 'python-cairo' 'python-regex' 'python-levenshtein' 'pywebkitgtk' 'python-psycopg2' 'ttf-ubuntu-font-family')
optdepends=('texlive-core: pdf support' 'pandoc: convert markdown to various formats')
makedepends=('python-distutils-extra' 'git')
conflicts=('uberwriter')
provides=('uberwriter')
install=install.sh

source=('uberwriter-git::git+https://github.com/wolfv/uberwriter.git' 'setup.patch')
md5sums=('SKIP' '226dfeba8413717c8c5a31eb18c1d067')

pkgver() {
	cd "$srcdir/$pkgname"
	(	set -o pipefail
		git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "$srcdir/$pkgname"
	patch -p0 < $srcdir/setup.patch
}

package() {
    cd "$srcdir/$pkgname"
    python3 setup.py install --root=${pkgdir}
}
