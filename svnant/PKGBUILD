# Contributor : Christopher Schwaab -- christopher.schwaab gmail
pkgname=svnant
pkgver=1.3.1
pkgrel=1
pkgdesc="An ant task that provides an interface to Subversion revision control system."
arch=(any)
url="http://subclipse.tigris.org/svnant.html"
license=('apache' 'custom')
source=("http://subclipse.tigris.org/files/documents/906/49042/$pkgname-$pkgver.zip")
md5sums=('78bcff3a08aa93b0f255ebe7264abcd7')
depends=('apache-ant')
provides=('svnkit')
conflicts=('svnkit')

build() {
	_anthome=$ANT_HOME
	[ -z "$_anthome" ] && _anthome=/usr/share/java/apache-ant

	cd $srcdir/
	mkdir -p $pkgdir/$_anthome/lib \
                 $pkgdir/usr/share/licenses/svnant
	install -m644 lib/{ganymed,jna,svnant,svnClientAdapter,svnkit,svnjavahl}.jar $pkgdir/$_anthome/lib/
	install -m644 lib/{GANYMED,JNA,SVNCLIENTADAPTER,SVNKit,JAVAHL}-LICENSE $pkgdir/usr/share/licenses/svnant
}
