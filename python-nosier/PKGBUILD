# Maintainer: Tom Vincent <http://www.tlvince.com/contact/>

pkgname="python-nosier"
_pkgname="nosier"
pkgver="1.1"
pkgrel="1"
pkgdesc="Monitors paths and upon detecting changes runs the specified command."
url="http://pypi.python.org/pypi/nosier"
arch=("i686" "x86_64")
license=("MIT")
depends=("inotifyx" "python2")
source=("http://pypi.python.org/packages/source/n/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=("d468326e2b52cba20ce1c0cf938b9e0b")

build()
{
    cd "$srcdir/$_pkgname-$pkgver"
    python2 setup.py install --prefix=/usr --root=$pkgdir || return 1
}
