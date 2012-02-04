# $Id: PKGBUILD,v 1.0 2008/09/13 15:10:18 lord Exp $
# Maintainer: lord <darklord@arkh.net>
# Contributor: lord <darklord@arkh.net>

pkgname=mrim
pkgver=0.1.1
pkgrel=1
pkgdesc="jabber mrim transport"
arch=('i686' 'x86_64')
url="http://yo.jabber.ru/files/mrim/"
license=('GPL')
depends=('python' 'xmpppy')
force=y
source=(http://yo.jabber.ru/files/mrim/mrim-$pkgver.tar.bz2 \
        mrim.rc \
	mrim-encoding.patch)
md5sums=('7a26b09714f913c07e0581ebc989467c'
         'd2ad822b4066eafb83a28bbf884d4a8b'
	 '30b33818eb61153bb3bae8db8eb3408c')

build()
{
    cd $startdir/src
    patch -p1 < $startdir/mrim-encoding.patch
    install -d -m0755 $startdir/pkg/usr/lib && \
    cp -r $pkgname $startdir/pkg/usr/lib && \
    install -d -m0755 $startdir/pkg/var/spool/mrim && \
    install -D -m0644 $startdir/src/mrim/mrim.conf.example $startdir/pkg/etc/ejabberd/mrim.conf && \
    ln -s ../../../etc/ejabberd/mrim.conf $startdir/pkg/usr/lib/$pkgname/mrim.conf && \
    install -D -m0755 mrim.rc $startdir/pkg/etc/rc.d/mrim
}
