# PKGBUILD by Giorgio Gilestro <giorgio@gilest.ro>
pkgname=nautilus-pastebin
pkgver=0.7.2
pkgrel=1
pkgdesc="Nautilus Pastebin Extension"
arch=('any')
url="https://launchpad.net/nautilus-pastebin"
license=('GPL')
depends=('python2' 'python2-notify' 'python2-nautilus' 'pygtk')
makedepends=('python2-distutils-extra')
source=(http://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz)
md5sums=('3ca6860d295f3a5db6aae16e1482be62')


build() {
    cd $srcdir/$pkgname-$pkgver
    python2 setup.py install --prefix=/usr --root=$pkgdir    
    mkdir -p $pkgdir/usr/lib/nautilus/extensions-2.0/python
    mkdir -p $pkgdir/usr/share/pixmaps/
    install $pkgdir/usr/bin/nautilus-pastebin.py $pkgdir/usr/lib/nautilus/extensions-2.0/python/
    install $srcdir/$pkgname-$pkgver/data/nautilus-pastebin.png $pkgdir/usr/share/pixmaps/
}

