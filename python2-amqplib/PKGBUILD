# Maintainer: Tevin Zhang <mail2tevin {at} gmail {dot} com>

pkgname=python2-amqplib
pkgver=1.0.2
pkgrel=4
pkgdesc="Python client for the Advanced Message Queuing Procotol (AMQP). Uses Python2."
arch=(any)
url=http://code.google.com/p/py-amqplib/
license=(LGPL)
depends=(python2-setuptools)
source=(http://py-amqplib.googlecode.com/files/amqplib-$pkgver.tgz)
sha256sums=('843d69b681a60afd21fbf50f310404ec67fcdf9d13dfcf6e9d41f3b456217e5b')
sha512sums=('6c8c9fd7fd68fd6a1eb944962094e57f89525bc78dd002dc0dadd491b262293367a86569dfc52f0701723b4327b7c290150dc2e69e3ac1a28613578d9e0d0710')

prepare() {
    # replace /usr/bin/env python with python2
    find amqplib-$pkgver -name '*.py' -type f -exec sed -ri 's:^#!/usr/bin/(env )?python$:&2:' '{}' \;
}

package() {
    cd amqplib-$pkgver/
    python2 setup.py install --root="$pkgdir" --prefix=/usr
}
