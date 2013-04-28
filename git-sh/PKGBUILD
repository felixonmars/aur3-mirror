# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Michal Karas <largon@largon.net>
pkgname=git-sh
pkgver=1.3
pkgrel=1
pkgdesc="A customized bash environment suitable for git work"
arch=(any)
url="http://github.com/rtomayko/git-sh/"
license=('GPL2')
depends=('git')
conflicts=('git-sh-git')
changelog=Changelog
source=("https://github.com/rtomayko/git-sh/archive/${pkgver}.tar.gz")
sha256sums=('461848dfa52ea6dd6cd0a374c52404b632204dc637cde17c0532529107d52358')

build() {
	cd $srcdir/$pkgname-$pkgver
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=${pkgdir} PREFIX='$(DESTDIR)/usr/' install

	# readme
	install -Dm644 README.markdown ${pkgdir}/usr/share/doc/${pkgname}/README.markdown
}

