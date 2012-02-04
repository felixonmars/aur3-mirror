# Maintainer: Mamut Ghiunhan <venerix@blug.ro>
pkgname=scriptfarm
pkgver=0.22
pkgrel=2
pkgdesc="A simple to use Scripts / Alias manager for Linux."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/scriptfarm/"
license=('GPL')
depends=('python2' 'pygtk')
install=('scriptfarm.install')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-${pkgver}.tar.gz $pkgname.sh $pkgname.desktop $pkgname.patch)
md5sums=('a3853c3f744cf62bedaa08707df50c77'
         'dab28a77e0b2f5a07de77ef8440993e3'
         '3c7b0a6940379c3e3e861d6d9e577c5d'
         '3b15ecdcb1506054a0d46554b566dff5')

build() {
    patch -Np0 -i $srcdir/$pkgname.patch
    cd $srcdir/$pkgname-$pkgver
    install -m 755 -d $pkgdir/usr/share/scriptfarm
    install -m 755 -D main.py $pkgdir/usr/share/scriptfarm/main.py
    install -m 755 -D $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
    install -m 644 -D $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    install -m 644 -D $srcdir/$pkgname-$pkgver/sf/gui/img/logo.png $pkgdir/usr/share/pixmaps/$pkgname.png
    cp -R sf $pkgdir/usr/share/scriptfarm
    cp -R integration $pkgdir/usr/share/scriptfarm
}
