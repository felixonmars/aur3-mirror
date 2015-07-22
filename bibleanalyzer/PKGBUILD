# Maintainer: MyWorld <mywereld at gmail dot com>

pkgname=bibleanalyzer
pkgver=5.0_0
pkgrel=1
pkgdesc="A cross platform Bible study software program."
url="http://www.bibleanalyzer.com"
license=("custom")
arch=('any')
depends=('wxpython' 'python2-espeak')
noextract=("${pkgname}_${pkgver//_/-}_all.deb")
source=("http://www.bibleanalyzer.com/files/${pkgname}_${pkgver//_/-}_all.deb"
	"LICENSE")
install=bibleanalyzer.install
md5sums=('0284f0a451ae21b83ceb5d729b07a695'
         '096341a48c2761d5dfd82e5e0401e9a0')

package() {
   cd "$srcdir"

   bsdtar xf "${pkgname}_${pkgver//_/-}_all.deb" data.tar.\*
   bsdtar xf data.tar.* -C "$pkgdir"

   install -Dm 644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
 }
