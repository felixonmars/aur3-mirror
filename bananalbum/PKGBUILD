# Contributor: graysky <graysky AT archlinux dot us>
pkgname=bananalbum
pkgver=6.2.4
pkgrel=1
pkgdesc="An elegant flash based JAlbum skin."
arch=('any')
url="http://www.bananalbum.net"
license=("freeware")
depends=('jalbum')
source=("BananAlbum.zip::http://jalbum.net/web/GetSkinFile?versionId=2150&type=zip")

build() {
 install -dm755 $pkgdir/usr/share/jalbum/skins/BananAlbum
 cp -r $srcdir/BananAlbum/* $pkgdir/usr/share/jalbum/skins/BananAlbum
}
sha256sums=('9982038d923de814ad43b85158e0eff3e8aabea5e2b4740850f2a80164f65039')
