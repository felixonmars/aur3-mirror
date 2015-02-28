# Maintainer: Josh Cartwright <joshc@eso.teric.us>
#
# Based on PKGBUILD by:
# Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Dan McGee <dpmcgee@gmail.com>

pkgname=sparse-git
pkgver=0.5.0.r44.g40791b9
pkgrel=1
pkgdesc='Semantic parser for C'
arch=('i686' 'x86_64')
url='http://sparse.wiki.kernel.org/'
license=('custom:OSL')
depends=('perl' 'libxml2')
conflicts=('sparse')
provides=('sparse')
source=(git://git.kernel.org/pub/scm/devel/sparse/sparse.git)
md5sums=('SKIP')

pkgver()
{
	cd "$srcdir/sparse"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
	make -C sparse
}

package()
{
	cd sparse
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/sparse/LICENSE
}
