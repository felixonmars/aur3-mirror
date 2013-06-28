# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Martin Devera <devik@cdi.cz>

pkgname=mnogosearch
pkgver=3.3.14
pkgrel=1
pkgdesc="Search Engine Software"
arch=(i686 x86_64)
url=http://www.mnogosearch.org
license=(GPL2)
depends=(libmysqlclient)
makedepends=(mysql)
options=(!emptydirs !libtool)
source=($url/Download/$pkgname-$pkgver.tar.gz)
sha256sums=('793bb0c8f42c8aef0d5e32166d386203f1e4811dd05c01dafb535f5a2ac3d084')
sha512sums=('d1f1729352d6815e2e628792ebb5bca317d51973acc706835c85901ae5f3bc423ca487c7c9a115be1b7d86b33c2afea7b602f714e92ac744c45370fc43399996')

build() {
    cd $pkgname-$pkgver/
    ./configure --prefix=/usr \
        --sysconfdir=/etc/$pkgname \
        --datadir=/usr/share/$pkgname \
        --localstatedir=/var \
        --with-mysql
    make
}

package() {
    make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}
