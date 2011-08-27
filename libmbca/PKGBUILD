# Contributor: Valmantas Palikša <walmis@balticum-tv.lt>

pkgname=libmbca
pkgver=0.04
pkgrel=1
pkgdesc="Mobile broadband configuration assistant library"
arch=('i686' 'x86_64')
url="http://live.gnome.org/NetworkManager/MobileBroadband"
license="GPL"
depends=('glib2>=2.16' 'libxml2' 'libgweather' 'hal' 'dbus-glib' 'mobile-broadband-provider-info')
makedepends=('subversion' 'pkgconfig' 'cvs')
source=()
md5sums=()
options=("!libtool")

__svnmod="libmbca"
__svntrunk="http://svn.gnome.org/svn/libmbca/tags/LIBMBCA_0_0_4/"

build() {
	cd "$srcdir"
	if [ -d $__svnmod/.svn ]; then
	(cd $__svnmod && svn up)
	else
	svn co $__svntrunk --config-dir ./ $__svnmod
	fi
	msg  "SVN checkout done or server timeout"
	msg "Starting make..."
	cd $__svnmod
	
	autoreconf -i
	./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/$pkgname --localstatedir=/var --disable-static
	make || return 1
	make DESTDIR="${pkgdir}" install || return 1
}


