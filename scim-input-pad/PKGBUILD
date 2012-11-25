# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Leigh <leighallison@earthlink.net>

pkgname=scim-input-pad
pkgver=0.1.3.1
pkgrel=1
pkgdesc="Input pad for SCIM used to input symbols and special characters"
arch=(i686 x86_64)
url=http://www.scim-im.org/
license=(GPL2)
depends=(scim)
source=(http://downloads.sourceforge.net/project/scim/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.gz)
sha256sums=('a561c3a256cb045f19c0bc2249b3d36a36df6800fa3479390ce1e693d6caae68')
sha512sums=('864a254814c0afa04c10143a6b0de4a927ff8612e01bed3776d09a910cfb12899c17245a89a0386f4fac59ebdaae9e6fb9dc9ff5981f72dbec952a9da52a413d')

build() {
    cd "$srcdir"/$pkgname-$pkgver/
    ./configure --prefix=/usr --enable-nls
    make
}

package() {
    cd "$srcdir"/$pkgname-$pkgver/
    make DESTDIR="$pkgdir" install
}
