# Maintainer: Adam Prescott <adam dot prescott at gmail dot com>
pkgname=prestomadcats-markdown
pkgver=20140219
pkgrel=1
pkgdesc='Basic markdown with github style css'
arch=('any')
url="https://github.com/adamprescott/prestomadcats-markdown"
license=('custom:Beerware')
depends=('markdown')
source=('MD.css'
	'genMD.sh')
md5sums=('6ec8d1b9126762a81abe69524891916d'
	 '58ea3de90f171dfe121d8d26c74a5d5e')

package() {
  msg "Source Dir $srcdir"
  msg "PKG Dir $pkgdir"
  cd "$srcdir"
  install -D -m644 MD.css ${pkgdir}/usr/share/madcats-markdown-css/MD.css
  install -D -m755 genMD.sh ${pkgdir}/usr/local/bin/genMD
}
