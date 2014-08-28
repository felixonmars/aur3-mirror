# Maintainer: Marcin Kolenda <marcinkolenda419@gmail.com>
# PreviousMaintainer: Valentin Haloiu <vially.ichb+aur@gmail.com>
#  Contributor: Lukas Linhart <bugs@almad.net>
#  Contributor: Marco Elver <marco.elver AT gmail.com>
#  Contributor: apkawa <apkawa@gmail.com>

pkgname=python-celery
pkgver=3.1.13
pkgrel=1
pkgdesc='Distributed Asynchronous Task Queue'
install=celery.install
arch=('any')
url='http://celeryproject.org/'
license=('BSD')
depends=('python' 'python-dateutil' 'python-kombu' 'python-billiard' 'python-pytz')
makedepends=('setuptools')
source=("https://pypi.python.org/packages/source/c/celery/celery-$pkgver.tar.gz" celery@.service celery.install tmpfilesd)
options=(!emptydirs)
sha256sums=('04b921326a64f17af5ba9c94e5189a498b36d8c01bebd215d12abeee0f55940c'
            '2c3b6eb4ebcc02f6748141d3dd1ebb64128b7b082724ebc15141144e2e40ebff'
            'b2744f019e11d57df825d9a970099a678ec1fffc5579ab52fb2270ec4aba741a'
            'c60185a7e2192dfd98d41cbea6ef0f8ed24cafd79aeae6f0792360fa6ddf6f46')

build() {
    cd $srcdir/celery-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/celery-$pkgver
    python setup.py install --root=$pkgdir/ --optimize=1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 $srcdir/celery@.service $pkgdir/usr/lib/systemd/system/celery@.service
    install -Dm644 $srcdir/tmpfilesd $pkgdir/usr/lib/tmpfiles.d/celery.conf
}
