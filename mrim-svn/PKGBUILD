# $Id: PKGBUILD,v 1.0 2008/09/14 18:56:18 lord Exp $
# Maintainer: lord <darklord@arkh.net>
# Contributor: lord <darklord@arkh.net>

pkgname=mrim-svn
pkgver=109
pkgrel=1
pkgdesc="jabber mrim transport for ejabberd"
arch=('i686' 'x86_64')
provides=('mrim')
conflicts=('mrim')
url="http://svn.xmpp.ru/repos/mrim/"
license=('GPL')
depends=('python' 'xmpppy')
force=y
source=(mrim.rc)
md5sums=('d2ad822b4066eafb83a28bbf884d4a8b')

_svntrunk=http://svn.xmpp.ru/repos/mrim/
_svnmod=mrim
_svnrev=$pkgver

build()
{
    cd $startdir/src
    msg "Updating mrim SVN..."
    svn co $_svntrunk -r $pkgver $_svnmod
    msg "SVN checkout done or server timeout"
    msg "Starting make..." 
    install -d -m0755 $startdir/pkg/usr/lib && \
    cp -r mrim $startdir/pkg/usr/lib && \
    install -d -m0755 $startdir/pkg/var/spool/mrim && \
    install -D -m0644 $startdir/src/mrim/mrim.conf.example $startdir/pkg/etc/ejabberd/mrim.conf && \
    ln -s ../../../etc/ejabberd/mrim.conf $startdir/pkg/usr/lib/mrim/mrim.conf && \
    install -D -m0755 mrim.rc $startdir/pkg/etc/rc.d/mrim
}
