# Contributor: snuo
pkgname=odvr
pkgver=0.1.5
pkgrel=1
pkgdesc="a userspace driver & utility for Olympus digital voice recorders that don't support USB Mass Storage"
arch=("i686" "x86_64")
url="http://code.google.com/p/odvr/"
license=("GPL3")
depends=("gtk2" "libusb" "libsndfile")
makedepends=()
source=("http://odvr.googlecode.com/files/$pkgname-$pkgver.tar.gz" "odvr-gui.desktop")
md5sums=('2b01d21c1af06b4b1dc180057e35789a'
         'aac0ec4dd8cfc779e9f399f79f7e9766')
sha1sums=('12fc0b2caa58a7b6cdbeb52bbd206f102d2d39fa'
          '910b1099f8bc4f7a9b728118de92762bcdad4d2d')
sha256sums=('5a2a8ecfa65b77f73a56eb5abbf201d2b95214ce6ee58de5129e6b3f0460aa8e'
            'dd62c5a064ac4f4edd6c973a92869a062631028e3a28e638d455f178226bfee5')
sha384sums=('92c55ea7c5dcb91aee8fd3e9f08a94da318715f848d969eb01758769ca1dc07792d9da50274eda886595503c21043bdf'
            '855fbd9fd44baeb7e84e46f05527fb720f9e0abb994bdff13da5f97fb9b9574b5c4ae7788cb9c1e0ab6130e88505a358')
sha512sums=('b17f3ff867beafef4e08a2ac3a2d83b34dc62074294f6a55f126f04674bc0846fe9e28bef268990ddb483be4571732e4b629bbbe138f3212a76431c50f76820f'
            '46bda8ef9866e92b9ab4808b0c99ce83b066a8fa9cbad0ac9080eeb27e6a25551f1deb71ac76197a5d02a54551affb1a3e86f7adf81172644595b1b7a3bad25e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make || return 1
  install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
  install -o root -g root -m 755 ./odvr $pkgdir/usr/bin/odvr
  install -o root -g root -m 755 ./odvr-gui $pkgdir/usr/bin/odvr-gui
  install -o root -g root -m 755 ../odvr-gui.desktop $pkgdir/usr/share/applications

}