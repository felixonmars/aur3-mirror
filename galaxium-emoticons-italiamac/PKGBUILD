# Contributor: H.Gökhan SARI <hsa2@difuzyon.net>
pkgname=galaxium-emoticons-italiamac
pkgver=1.5
pkgrel=1
pkgdesc="About all the emoticons from ItaliaMac Forum for Galaxium."
arch=('any')
url="http://www.adiumxtras.com/index.php?a=xtras&xtra_id=4560"
license=('GPL')
depends=('galaxium')
source=('http://www.difuzyon.net/linux/galaxium-stuff/ItaliaMac.AdiumEmoticonset.tar.gz')
noextract=('ItaliaMac.AdiumEmoticonset.tar.gz')
md5sums=('d5d497b6c641a90edce24e516e277645')

build() {
  cd "$srcdir/"

  mkdir -p $pkgdir/usr/share/galaxium/Themes/AdiumEmoticons/
  cp $srcdir/ItaliaMac.AdiumEmoticonset.tar.gz $pkgdir/usr/share/galaxium/Themes/AdiumEmoticons/
}
