# Contributor: Getty Ritter <gettyritter@gmail.com>
# Contributor: Giorgio Lando <patroclo7@gmail.com>
# Contributor: bender02 at gmx dot com
pkgname=ngetty
pkgver=1.2
pkgrel=1
pkgdesc="Daemon that starts login sessions on virtual console terminals, on demand"
url="http://riemann.fmi.uni-sofia.bg/ngetty/"
license=('GPL2')
arch=('i686' 'x86_64')
makedepends=(dietlibc)
backup=(etc/conf.d/ngetty)
source=(http://riemann.fmi.uni-sofia.bg/ngetty/$pkgname-$pkgver-rc1.tar.gz
        ngetty.rcd
        ngetty.confd)
md5sums=('cc4d81d9a25631b023d037c8c47a4dfd'
         '41b7668e51feb1dc13afb6e92e1a1016'
         '7f5e423ebad0fd46f923418a4e1d38c8')
build() {
    cd $srcdir/$pkgname-$pkgver-rc1
    make CC='/opt/diet/bin/diet -Os gcc -W' all
}
package() {
    cd $srcdir/$pkgname-$pkgver-rc1
    sed -i 's/-g utmp/-g root/' Makefile
    sed -i 's/sbin/usr\/bin/g' Makefile
    make DESTDIR=$pkgdir install install_other
    chmod 700 $pkgdir/etc/ngetty
    rm $pkgdir/etc/ngetty/Conf
    install -m755 -o root -g root -D $srcdir/ngetty.rcd $pkgdir/etc/rc.d/ngetty
    install -m644 -o root -g root -D $srcdir/ngetty.confd $pkgdir/etc/conf.d/ngetty
}
