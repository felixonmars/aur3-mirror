# Maintainer: Trần Đức Nam <dynamo.foss@gmail.com>
# Contributor: HanoiLUG Ubuntu Team <hanoilug@lists.hanoilug.org>
pkgname=stardict-vi-vi
pkgver=1.0
pkgrel=1
pkgdesc="Vietnamese to Vietnamese dict (Stardict format)"
arch=('any')
url=('http://www.hanoilug.org')
license="GPL"
depends=('stardict')
source=('stardict-dic-vi-vi_1.0_all.deb::http://www.hanoilug.org/ubuntu/dists/raring/contrib/pool/stardict-dic-vi-vi_1.0_all.deb')
md5sums=('e663eb2a15454371c0fcfead912997d3')


package() {
	cd $srcdir
	ar x stardict-dic-vi-vi_1.0_all.deb
	tar xvf data.tar.gz
	cp -R usr $pkgdir
}
