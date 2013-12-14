# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgbase=django-dajaxice
pkgname=django-dajaxice
true && pkgname=(python-$pkgbase python2-$pkgbase)
pkgver=0.5.5
pkgrel=1
pkgdesc="Easy to use AJAX library for django that simplifies the asynchronous communication between the django server side code and your JS code"
arch=(any)
url=http://dajaxproject.com
license=(BSD)
source=($pkgbase-$pkgver.tar.gz::https://github.com/jorgebastida/$pkgbase/archive/$pkgver.tar.gz)
sha256sums=('d49879f220d40de75c04bfd6248e4d99d52b774c3925c5a915b5949a8df8b3e2')
sha512sums=('57e141069d9d001bba2e1b371fef3a97fe01989a2f411c71be248e009b224c4ea6023872d791d89f1337cd8b9f3ebf2491e59088486305f5fa2cfde5e7eff75b')

package_python-django-dajaxice() {
    depends=(python)

    cd $pkgbase-$pkgver/
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}

package_python2-django-dajaxice() {
    depends=(python2)

    cd $pkgbase-$pkgver/
    python2 setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}

depends=(python{,2})
true && depends=()
