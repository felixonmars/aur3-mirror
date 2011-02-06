# Contributor: ignis32 <ignis32@gmail.com> 
pkgname=mrimt
pkgver=109
pkgrel=2
pkgdesc="Mail.Ru agent IM Jabber Transport"
url="jabber://mrim@conference.jabber.ru"
arch=(i686)
license=(GPL)
depends=(xmpppy python)
makedepends=(subversion)
conflicts=()
install=$pkgname.install
source=(\
        mrimt.conf.adapted \
	mrimt.rc.sh \
	$pkgname.install
)
md5sums=('019618f61e9bf5db6a5bda59fc25deac'
         'd2d4f4eb6ac4f1e61d4af8fa608f5e08'
         'db6638f61feb972ab4f1438246c8c2d5')
		  
backup=('etc/ejabberd/mrimt.conf')
_svn0=http://svn.xmpp.ru/repos/mrim/
_svn0name=mrimt
_svn0rv=$pkgver


build() {
	cd $stardir
	svn co $_svn0 --config-dir ./ -r $_svn0rv $startdir/$_svn0name
	install -D -m755 $startdir/mrimt.rc.sh  $pkgdir/etc/rc.d/mrimt
        rm -r $startdir/mrimt/.svn
	rm -r $startdir/mrimt/src/.svn
	install -d -m750 $startdir/mrimt   $pkgdir/usr/lib/mrimt
	cp -r $startdir/mrimt/*   $pkgdir/usr/lib/mrimt/
        install -D -m660  $startdir/mrimt.conf.adapted $pkgdir/etc/ejabberd/mrimt.conf
	install -d $pkgdir/var/{lib,log,spool}/mrimt
	rm -r $startdir/mrimt
}
