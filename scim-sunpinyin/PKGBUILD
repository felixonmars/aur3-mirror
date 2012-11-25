# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Lyman Li <lymanrb@gmail.com>

pkgname=scim-sunpinyin
pkgver=2.0.3
pkgrel=2
pkgdesc="A wrapper around SunPinyin which enables user to use SunPinyin with SCIM."
arch=(i686 x86_64)
url=http://code.google.com/p/sunpinyin/
license=(CDDL LGPL)
depends=(scim sunpinyin)
makedepends=(scons)
source=(http://sunpinyin.googlecode.com/files/$pkgname-$pkgver.tar.gz)
sha256sums=('139feca7ccb79240b5c7eac3d41fb7015baad21b08986af1bec33b7aeb3a4e83')
sha512sums=('f983d40972c5792a4a27fdf699cffc7f6882c84060cfe3e260cdc3f587743b0f71339ccdb7067b393f88a69b74d999fba70c4d9bc8016b9b217b3c11667a2986')

package() {
    cd "$srcdir"/$pkgname-$pkgver/
    scons install --install-sandbox="$pkgdir"
}
