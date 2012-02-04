# Contributor: H.Gökhan SARI <hsa2@difuzyon.net>
pkgname=galaxium-emoticons-wlmicons
pkgver=1.0
pkgrel=1
pkgdesc="All of the Windows Live Messenger emoticons for Galaxium in high quality, including the Bunny and the I'm icons."
arch=('any')
url="http://www.adiumxtras.com/index.php?a=xtras&xtra_id=6061"
license=('GPL')
depends=('galaxium')
source=('http://www.difuzyon.net/linux/galaxium-stuff/WindowsLive.AdiumEmoticonset.tar.gz')
noextract=('WindowsLive.AdiumEmoticonset.tar.gz')
md5sums=('805214e87d86f960ce1f3fc4501a653d')

build() {
  cd "$srcdir/"

  mkdir -p $pkgdir/usr/share/galaxium/Themes/AdiumEmoticons/
  cp $srcdir/WindowsLive.AdiumEmoticonset.tar.gz $pkgdir/usr/share/galaxium/Themes/AdiumEmoticons/
}
