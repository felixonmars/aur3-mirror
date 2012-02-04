# Contributor: Jakub Luzny <limoto94@gmail.com>

pkgname=django-tinymce
pkgver=1.5
pkgrel=1
pkgdesc='TinyMCE widget for Django'
arch=(i686 x86_64)
url='http://code.google.com/p/django-tinymce/'
license=('MIT')
depends=('django')
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('75fe943c596ffae1205847aed365a16b')

build() { 
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build || return 1
    python setup.py install --root="$pkgdir" || return 1
}

#category: devel
# vim:set ts=2 sw=2 et: