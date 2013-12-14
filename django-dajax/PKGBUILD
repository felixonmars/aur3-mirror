# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgbase=django-dajax
pkgname=django-dajax
true && pkgname=(python-$pkgbase python2-$pkgbase)
pkgver=0.9.2
pkgrel=2
pkgdesc="Dajax is a powerful tool to easily and super-fastly develop asynchronous presentation logic in web applications using Python and almost no lines of JS source code"
arch=(any)
url=http://dajaxproject.com
license=(BSD)
depends=(django-dajaxice)
source=($pkgbase-$pkgver.tar.gz::https://github.com/jorgebastida/$pkgbase/archive/$pkgver.tar.gz)
sha256sums=('aa3e95ef71e45fde538e0f71395ccc206d9d46487491c4086c8e02a07ea6aad7')
sha512sums=('59195b0fc570b3b7b79acff86f855fa2670a34486449e4f5a815eb6a85cac7a716c5da5de61866143aec397bb840dac681f71190a34cdb754accd19acccb6934')

package_python-django-dajax() {
    depends=(python)

    cd $pkgbase-$pkgver/
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}

package_python2-django-dajax() {
    depends=(python2)

    cd $pkgbase-$pkgver/
    python2 setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}

depends=(python{,2})
true && depends=()
