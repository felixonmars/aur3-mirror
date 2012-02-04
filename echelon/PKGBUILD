# Contributor: MeMi69 <MetalMilitia@gmx.net>
pkgname=echelon
pkgver=0.1
pkgrel=1
pkgdesc="A game server and friend monitoring applet for the Gnome Desktop"
arch=(i686 x86_64)
url="http://echelon-applet.sourceforge.net/"
license=('GPL2')
depends=('python' 'pygtk' 'gnome-python' 'gnome-python-extras' 'qstat')
source=(http://downloads.sourceforge.net/echelon-applet/$pkgname-$pkgver.tar.gz)
md5sums=('e3e3bfc3cba7704081a47c574868a4bc')

build() {
	  cd $startdir/src/$pkgname-$pkgver
	    ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/bin
	      make || return 1
	        make DESTDIR=$startdir/pkg install || return 1
	}
