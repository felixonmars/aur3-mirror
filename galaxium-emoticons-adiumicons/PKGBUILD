# Contributor: H.Gökhan SARI <hsa2@difuzyon.net>
pkgname=galaxium-emoticons-adiumicons
pkgver=0.9
pkgrel=1
pkgdesc="Emoticon theme submitted by Oscar Gruno."
arch=('any')
url="http://www.adiumxtras.com/index.php?a=xtras&xtra_id=1706"
license=('GPL')
groups=()
depends=('galaxium')
source=('http://www.difuzyon.net/linux/galaxium-stuff/Adiumicons.AdiumEmoticonset.tar.gz')
noextract=('Adiumicons.AdiumEmoticonset.tar.gz')
md5sums=('a1f583149e7df8f16c904860f528ea80')

build() {
  cd "$srcdir/"

  mkdir -p $pkgdir/usr/share/galaxium/Themes/AdiumEmoticons/
  cp $srcdir/Adiumicons.AdiumEmoticonset.tar.gz $pkgdir/usr/share/galaxium/Themes/AdiumEmoticons/
}
