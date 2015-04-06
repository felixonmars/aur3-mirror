# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Josh Chase <jcjoshuachase@gmail.com>

pkgname=nova
_relname=kilo
pkgver=2015.1.0b3
pkgrel=1
pkgdesc="OpenStack cloud computing fabric controller"
arch=(any)
url=https://launchpad.net/nova
license=(custom)
depends=(glance python2-amqplib python2-babel python2-carrot python2-cheetah python2-daemon
    python2-feedparser python2-gflags python2-lockfile python2-novaclient python2-paramiko
    python2-suds)
makedepends=(python2-setuptools)
source=($url/$_relname/$_relname-3/+download/$pkgname-$pkgver.tar.gz)
sha256sums=('d368d82c1af03c353e84b8ec3d8d790c51e5882860880c75f4f4a40297e4539e')
sha512sums=('274f45040dbf3777b83e2bdfa341d2c06122a147e5ff9bc669852a58c0dd949740c5a3706fae4de27fce2c606daeaecd52ad1e698ca5ca3a66cd86a614c83f33')

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
