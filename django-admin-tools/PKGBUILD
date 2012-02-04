# Maintainer: Alper KANAT <alperkanat@raptiye.org>

pkgname=django-admin-tools
pkgver=0.4.1
pkgrel=2
pkgdesc="A collection of tools for the django administration interface"
url="http://pypi.python.org/pypi/django-admin-tools"
arch=('any')
license=('GPL2')
makedepends=("python2-distribute")
depends=("python2" "django")
source=(https://bitbucket.org/izi/$pkgname/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('7ec8a5cc8ea33998527f4cc3db8383d5')

build() {
	cd $srcdir/$pkgname-$pkgver

    msg "Starting make..."
    python2 setup.py build || return 1
    python2 setup.py install --root=$pkgdir || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver

    msg "Installing license..."
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

    msg "Installing docs..."
    install -Dm644 AUTHORS $pkgdir/usr/share/doc/$pkgname/AUTHORS
    install -Dm644 CHANGELOG $pkgdir/usr/share/doc/$pkgname/CHANGELOG
    install -Dm644 INSTALL $pkgdir/usr/share/doc/$pkgname/INSTALL
    install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
    cp -r docs/* $pkgdir/usr/share/doc/$pkgname/
}
