# Contributor: Andrei Antoukh - niwi@niwi.be - http://www.niwi.be

pkgname=glusterfs
pkgver=3.2.4
pkgrel=1
pkgdesc="Is a cluster file-system capable of scaling to several peta-bytes."
arch=('i686' 'x86_64')
url="http://www.gluster.org/"
license=('AGPL3')
groups=('clustering')
depends=('fuse' 'flex' 'bison' 'python2')

source=(http://ftp.gluster.com/pub/gluster/glusterfs/3.2/$pkgver/$pkgname-$pkgver.tar.gz glusterd)
md5sums=('1ec38e9c40b6a6ac80dd03e1c8bc1543' '83b410e192e727fd87278b07b876fad2')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
    make || return 1
    make DESTDIR="$pkgdir" install
    install -D -m 755 $srcdir/$pkgname-$pkgver/README $pkgdir/usr/share/doc/glusterfs/
    install -D -m 755 $srcdir/$pkgname-$pkgver/INSTALL $pkgdir/usr/share/doc/glusterfs/
    install -D -m 755 $srcdir/$pkgname-$pkgver/COPYING $pkgdir/usr/share/doc/glusterfs/
    cp -rf $srcdir/$pkgname-$pkgver/doc/* $pkgdir/usr/share/doc/glusterfs/
    install -D -m 755 ${srcdir}/glusterd ${pkgdir}/etc/rc.d/glusterd
}

# vim:set ts=2 sw=2 et:
