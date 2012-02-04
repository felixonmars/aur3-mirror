# Maintainer: Tom Vincent <http://www.tlvince.com/contact/>

pkgname="python-nosenotify"
_pkgname="nose-notify"
pkgver="0.2"
pkgrel="1"
pkgdesc="A nose plugin to display testsuite progress in the notify osd."
url="http://pypi.python.org/pypi/nose-notify"
arch=("i686" "x86_64")
license=("BSD")
depends=("python-nose" "python-notify")
source=("http://pypi.python.org/packages/source/n/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=("0fe879fa345470fb0c01560110b14ac2")

build()
{
    cd "$srcdir/$_pkgname-$pkgver"
    python2 setup.py install --root=$pkgdir
}
