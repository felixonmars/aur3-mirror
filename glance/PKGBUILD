# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Josh Chase <jcjoshuachase@gmail.com>

pkgname=glance
_relname=kilo
pkgver=2015.1.0b3
pkgrel=1
pkgdesc="OpenStack image registry and delivery service"
arch=(any)
url=https://launchpad.net/glance
license=(custom)
depends=(python2-jsonpointer python2-glanceclient python2-keystoneclient
         python2-pyopenssl python2-warlock)
makedepends=(python2-setuptools)
source=($url/$_relname/$_relname-3/+download/$pkgname-$pkgver.tar.gz)
sha256sums=('d49c6e1f12d96d29d19f479bcd7f8baa31be9548162d48f114b90517a7ce39bc')
sha512sums=('1d822f87a09038b56e245ab695e1899a90e3b1d5ae8bf10386b3fda23abbde518fa565fb6802a0e205201e7e35e00b2fb915a05a5c7634bca76581dc42937417')

prepare() {
    find $pkgname-$pkgver -type f -exec sed -ri 's:^#!/usr/bin/(env )?python$:&2:' '{}' \;
}

build() {
    cd $pkgname-$pkgver/
    python2 setup.py build
}

package() {
    cd $pkgname-$pkgver/
    python2 setup.py install --root="$pkgdir" --optimize=1

    install -d "$pkgdir"/etc/
    cp -r etc/ "$pkgdir"/etc/$pkgname/
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
