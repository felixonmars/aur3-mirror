# Maintainer:   Ashren <regj [at] arch-ed [dot] dk>

pkgname="repscrot"
pkgver=2.0
pkgrel=4
pkgdesc="Bash script for repetitive screen shotting. Bind it to a keyboard shortcut."
url="http://www.arch-ed.dk/screenshot-tool-for-repetitive-screenshotting/"
arch=("i686" "x86_64")
license=("WTFPL")
depends=("xdotool" "imagemagick")
source=("http://www.arch-ed.dk/wp-content/uploads/2015/02/${pkgname}-${pkgver}.tar.gz")
        
sha1sums=('fa9eb6a6eeeb5151514d3804706859683b47605e')

package() {
install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.8" "$pkgdir/usr/share/man/man8/$pkgname.8"
}
