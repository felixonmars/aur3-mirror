# Contributor: Szasz Marton <pcmarci[at]gmail[dot]com>
_pkgname=lxp
pkgname=$_pkgname-core
pkgver=0.2
pkgrel=1
pkgdesc="The main package of LXP, a project to make linux look like Windows XP"
arch=('i686' 'x86_64')
url="http://lxp.sourceforge.net/"
license=('GPLv2')
groups=('lxp')
depends=('xdialog' 'xosview')
makedepends=('gcc' 'make')
source=("http://puzzle.dl.sourceforge.net/project/lxp/lxp-sources/$pkgver-$pkgrel/$_pkgname-$pkgver.tar.gz")
md5sums=('049d6981b036dac0fa15496313c250d6')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" INSTALL="/bin/install -c" install
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/COPYING"
}
