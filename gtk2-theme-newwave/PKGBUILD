# Maintainer: Jens Kleikamp <jens [at] codes-concepts.com>
# Contributer: Mark Pustjens <pustjens@dds.nl>
# Contributor: Joel Almeida <aullidolunar at gmail dot c0m>

pkgname=gtk2-theme-newwave
pkgver=0.9.0
pkgrel=3
pkgdesc="The New Wave themes (beta version)"
arch=('any')
url="https://launchpad.net/anton"
license=('GPL')
depends=('gtk-engines')
source=('https://launchpad.net/anton/newwave-0.9.x/newwave-0.9.0-beta1/+download/newwave-090-beta-1.tar.gz')
md5sums=('89ccb7bb110df897d27755d54eec930e')

build() {
	cd "${srcdir}"
}

package() {
	mkdir -p "${pkgdir}/usr/share/themes"
	cp -r "New Wave" "${pkgdir}/usr/share/themes"
	find "$pkgdir/" -type d -exec chmod 755 "{}" \+
	find "$pkgdir/" -type f -exec chmod 644 "{}" \+
}
