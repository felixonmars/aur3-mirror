# Maintainer: mshade <mshade@mshade.org>
# Old Maintainer: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Chris Giles <Chris.G.27 (at) Gmail.com>

pkgname=junglediskdesktop
_subver=160
pkgver=3.${_subver}
pkgrel=4
pkgdesc="Online backup and storage powered by Amazon S3™ and Rackspace"
arch=("i686" "x86_64")
url="http://www.jungledisk.com/"
license=("custom")
depends=("gtk2" "libnotify" "libsm" "libxxf86vm")
optdepends=("fuse")

if [ "${CARCH}" == "i686" ]; then
	source=(http://downloads.jungledisk.com/jungledisk/${pkgname}3${_subver}.tar.gz)
	sha1sums=('1f9f85a9b881671b945ede72b022926cd17888b4')
elif [ "${CARCH}" == "x86_64" ]; then
	source=(http://downloads.jungledisk.com/jungledisk/${pkgname}64-3${_subver}.tar.gz)
	sha1sums=('d00c1f34f7dfcbcc1193d70f99a2f4740c9c25a9')
fi

package() {
   cd "$srcdir/$pkgname"

   # Command-Line Utility
   install -Dm755 jungledisk "$pkgdir/usr/bin/jungledisk"

   # Application
   install -Dm755 $pkgname "$pkgdir/usr/bin/"
   
   # License
   install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
   
   # Desktop
   install -Dm644 junglediskdesktop.desktop "$pkgdir/usr/share/applications/junglediskdesktop.desktop"

   # Icon
   install -Dm644 junglediskdesktop.png "$pkgdir/usr/share/pixmaps/junglediskdesktop.png"

   # Dirty hack, until upstream updates their dependency
   mkdir -p "$pkgdir/usr/lib"
   ln -vs /usr/lib/libnotify.so.4 "$pkgdir/usr/lib/libnotify.so.1"
}
