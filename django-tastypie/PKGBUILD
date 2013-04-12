# Maintainer: Alper KANAT <alperkanat@raptiye.org>

pkgname=django-tastypie
pkgver=0.9.14
pkgrel=1
pkgdesc="Creating delicious APIs for Django apps since 2010."
url="https://github.com/toastdriven/django-tastypie"
arch=('any')
license=('BSD')
makedepends=("python2-distribute")
depends=("python2" "python2-django" "python2-mimeparse" "python2-dateutil")
optdepends=('python2-lxml: if using the XML serializer'
            'python2-yaml: if using the YAML serializer'
            'uuid: (present in python >= 2.5) if using the ApiKey authentication')
source=($pkgname-$pkgver.tar.gz::https://github.com/toastdriven/$pkgname/tarball/v$pkgver)
md5sums=('8b957fa0ff3cdb3a6c614d17bd63e3e3')

build() {
	cd $srcdir/toastdriven-$pkgname-*

    msg "Starting make..."
    python2 setup.py build || return 1
    python2 setup.py install --root=$pkgdir || return 1
}

package() {
	cd $srcdir/toastdriven-$pkgname-*

    msg "Installing license..."
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

    msg "Installing docs..."
    mkdir -p $pkgdir/usr/share/doc/$pkgname
    cp -r docs/ $pkgdir/usr/share/doc/$pkgname/
    install -Dm644 AUTHORS $pkgdir/usr/share/doc/$pkgname/AUTHORS
    install -Dm644 README.rst $pkgdir/usr/share/doc/$pkgname/README.rst
    install -Dm644 requirements.txt $pkgdir/usr/share/doc/$pkgname/requirements.txt
    install -Dm644 TODO $pkgdir/usr/share/doc/$pkgname/TODO
    install -Dm644 tox.ini $pkgdir/usr/share/doc/$pkgname/tox.ini
}
