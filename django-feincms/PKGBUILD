# Contributor: Gour <gour@gour-nitai.com>
# Maintainer: apkawa <apkawa@gmail.com>
pkgname=django-feincms
_pkgname=FeinCMS
pkgver=1.4.2
pkgrel=1
pkgdesc="Django-based Page CMS and CMS building toolkit"
arch=('any')
url="http://github.com/matthiask/feincms/tree/master"
license=('custom')
depends=('python2' 'django' 'django-tagging-svn' 'django-mptt-svn')
source=(http://pypi.python.org/packages/source/F/FeinCMS/FeinCMS-${pkgver}.tar.gz)

build() {
    cd "$srcdir/$_pkgname-$pkgver"

    python2 setup.py install --root=$pkgdir || return 1
    install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
md5sums=('f6d22b1a43ee52ebdd9f0151619d422d')
