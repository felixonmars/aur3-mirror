# Maintainer: Tianjiao Yin <ytj000@gmail.com>
pkgname=hg-experimental-hg
pkgver=r232.2f167dff9483
pkgrel=1
pkgdesc="This is a collection of proof-of-concept Mercurial extensions written at Facebook"
arch=('any')
url="https://bitbucket.org/facebook/hg-experimental"
license=('GPL')
depends=('mercurial')
source=('hg-experimental-hg::hg+ssh://hg@bitbucket.org/facebook/hg-experimental')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/hg-experimental-hg"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
	cd "$srcdir/${pkgname}"
	make PYTHON='python2' PREFIX="$pkgdir/usr" install
}
