# Maintainer: WU Jun <quark at lihdd dot net>

pkgname=ibus-cloud-pinyin-svn
pkgver=82
pkgrel=1
pkgdesc="Pinyin input method based on online pinyin services and ibus. This is its svn version."
arch=('i686' 'x86_64')
url="http://ibus-cloud-pinyin.googlecode.com/"
license=('GPL')
depends=('ibus>=1.3.4' 'lua>=5.1' 'luasocket' 'sqlite3' 'libnotify' 'libgee')
makedepends=('subversion>=1.5' 'xz' 'vala>=0.8')
replaces=('ibus-cloud-pinyin')
conflicts=('ibus-cloud-pinyin')
source=(http://ibus-cloud-pinyin.googlecode.com/files/pinyin-database-1.2.99.tar.xz)
noextract=('pinyin-database-1.2.99.tar.xz')
md5sums=('46c8b7b4020ccd7f05c61c00181fbe4a')

_svntrunk=$url/svn/trunk/
_svnmod=$pkgname

build() {
	cd "$srcdir"
	
	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up)
	else
		svn co $_svntrunk $_svnmod
	fi
	
	msg "SVN checkout done or server timeout"
	msg "Starting make..."
	cd "$srcdir/$_svnmod"
	ln ../pinyin-database-1.2.99.tar.xz .
	make || return 1
}

package() {
	cd ${srcdir}/${_svnmod}/
	make DESTDIR=${pkgdir} install || return 1
}
