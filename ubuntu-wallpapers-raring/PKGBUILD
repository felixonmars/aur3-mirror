pkgname="ubuntu-wallpapers-raring"
pkgver=14.04.0.1
pkgrel=2
pkgdesc="A set of desktop backgrounds for Ubuntu 14.04 LTS"
arch=('any')
url="https://launchpad.net/ubuntu/+archive/primary/+files/"
license="unknown"
source="https://launchpadlibrarian.net/169800145/ubuntu-wallpapers_$pkgver.orig.tar.gz"
md5sums=('7540e6ad4dc6fa481b692db70f8c8504')
package() {
   cd "$srcdir/$pkgname-$pkgver"
   mkdir -p $pkgdir/usr/share/backgrounds/ubuntu-raring
   cp -r * $pkgdir/usr/share/backgrounds/ubuntu-raring
}

