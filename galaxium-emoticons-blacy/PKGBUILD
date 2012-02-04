# Contributor: H.Gökhan SARI <hsa2@difuzyon.net>
pkgname=galaxium-emoticons-blacy
pkgver=1.0
pkgrel=1
pkgdesc="Full set of web-based Gtalk animated client icons for Galaxium."
arch=('any')
url="http://www.adiumxtras.com/index.php?a=xtras&xtra_id=2762"
license=('GPL')
depends=('galaxium')
source=('http://www.difuzyon.net/linux/galaxium-stuff/GTalk.AdiumEmoticonset.tar.gz')
noextract=('GTalk.AdiumEmoticonset.tar.gz')
md5sums=('aa4a4ea18fad4cb865187677c80959d5')

build() {
  cd "$srcdir/"

  mkdir -p $pkgdir/usr/share/galaxium/Themes/AdiumEmoticons/
  cp $srcdir/GTalk.AdiumEmoticonset.tar.gz $pkgdir/usr/share/galaxium/Themes/AdiumEmoticons/
}
