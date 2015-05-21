# Maintainer: gborzi <gborzi@ieee.org>
# Contributor: ShadowKyogre <shadowkyogre@gmail.com>

pkgname=stardict-thesaurus-ee
pkgver=2.4.2
pkgrel=5
pkgdesc="English Thesaurus for Stardict"
arch=('any')
depends=('stardict')
url="http://stardict.sourceforge.net"
license=('GPL')
source=(http://tsubasa.googlecode.com/files/$pkgname-$pkgver.tar.bz2)
md5sums=('b916732a00d5e11750a82a4bc62c2052')

package() {
	cd $srcdir/$pkgname-$pkgver
	mkdir -p $pkgdir/usr/share/stardict/dic/thesaurus-ee
	install -m 644 thesaurus-ee.ifo \
	               thesaurus-ee.idx \
	               thesaurus-ee.dict.dz \
	               $pkgdir/usr/share/stardict/dic/thesaurus-ee
}
