# Contributor: Morgan LEFIEUX <comete_AT_archlinuxfr.org>
# Contributor (since 2009-05-13): Juan Diego Tascon
# Contributor (update for nogui version): David Brown <arch AT davidb DOT org>

pkgname=kedpm-nogui
pkgver=0.4.0
pkgrel=2
pkgdesc="A password manager that helps to manage large numbers of passwords."
arch=('i686' 'x86_64')              
url="http://kedpm.sourceforge.net"
license="GPL"
depends=('python' 'pycrypto')
source=(http://dl.sourceforge.net/sourceforge/kedpm/kedpm-$pkgver.tar.gz)
md5sums=('6b83a646873f8ea00af9c6403aa259bc')

build() {
    cd $srcdir/kedpm-$pkgver/
    sed -i -e 's/"gtk"  # default/"cli"  # default/' scripts/kedpm
    python setup.py install --prefix $pkgdir/usr
}
