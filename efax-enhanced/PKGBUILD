pkgname=efax-enhanced
pkgver=0.9a
pkgrel=3
pkgdesc="A lightweight program for sending and receiving faxes using any fax modem (Class 1, 2 or 2.0)"
arch=('i686' 'x86_64')
url="http://shino.pos.to/linux/efax.html"
license=('GPL')
depends=('glibc')
provides=('efax')
replaces=('efax')
source=(
    "http://www.cce.com/efax/download/efax-$pkgver-001114.tar.gz"
    "fax"
    "efax-0.9-nullptr.patch"
    "efax-0.9-numlines.patch"
    "efax-0.9a-frlen.patch"
    "efax.rc.sample"
)    
md5sums=(
    '28abef47d9700eb1c20bf5770565aa7d'
    'a2fc96986144113e0e8ed1fa2421ba8e'
    '6444359aba71daaf89cf942c0dc8f01e'
    'b05724b0443bbe470a628ce6d804bef1'
    '8ac6555df63997605623f1bc2b2cff92'
    '4411d7d69c1dbba631d20614441e6852'
)

build()
{
    cd $srcdir/efax-$pkgver-001114
    patch -p1 -i ../efax-0.9-nullptr.patch || return 1
    patch -p1 -i ../efax-0.9-numlines.patch || return 1
    patch -p0 -i ../efax-0.9a-frlen.patch || return 1

    make || return 1
    mkdir -p $pkgdir/usr/{bin,man/man1}
    make BINDIR=$pkgdir/usr/bin MANDIR=$pkgdir/usr/man install || return 1

    install -d -m777 $pkgdir/var/spool/fax
    install -d -m1777 /var/lock
    mkdir -p $pkgdir/etc
    install -m 644 $srcdir/efax.rc.sample $pkgdir/etc
    install -m 755 $srcdir/fax $pkgdir/usr/bin
    cd $pkgdir/usr/bin
    ln fax faxlpr
}
