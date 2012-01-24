# Maintainer: Alper KANAT <alperkanat@raptiye.org>

pkgname=django-grappelli
pkgver=2.3.5
pkgrel=2
pkgdesc="A jazzy skin for the Django Admin-Interface"
url="https://github.com/sehmaschine/django-grappelli"
arch=('any')
license=('GPL2')
makedepends=("python2-distribute")
depends=("python2" "django")
source=($pkgname-$pkgver.tar.gz::https://github.com/sehmaschine/$pkgname/tarball/$pkgver)
md5sums=('36291a468ea10d50b33d782413cd436c')

build() {
	cd $srcdir/sehmaschine-django-grappelli-*

    msg "Starting make..."
    python2 setup.py build || return 1
    python2 setup.py install --root=$pkgdir || return 1
}

package() {
	cd $srcdir/sehmaschine-django-grappelli-*

    msg "Installing license..."
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

    msg "Installing docs..."
    install -Dm644 AUTHORS $pkgdir/usr/share/doc/$pkgname/AUTHORS
    install -Dm644 README.rst $pkgdir/usr/share/doc/$pkgname/README.rst
    cp -r docs/* $pkgdir/usr/share/doc/$pkgname/
}
