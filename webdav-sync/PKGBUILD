# Maintainer: Tobias T. <OldShatterhand at gmx-topmail dot de>

pkgname=webdav-sync
pkgver=1.1.4
pkgrel=1
pkgdesc="Command line tool for synchronisation of a local directory with a WebDAV collection"
arch=('i686' 'x86_64')
url=("http://www.re.be/webdav_sync/index.xhtml")
license=('Public Domain')
depends=('java-runtime>=1.6')
optdepends=('apache-ant>=1.7: Running WebDAV-Sync as Ant task')
source=('http://sourceforge.net/projects/webdav-sync/files/webdav-sync/1.1.4/webdav_sync1_1_4.jar'
	'webdav-sync')
md5sums=('24075687c2cee509452adf2413b12ef2'
	 '8c6b155a07b23c6c79d90b865f2d4ee9')


package() {
	install -Dm644 $srcdir/webdav_sync1_1_4.jar "${pkgdir}"/usr/share/java/webdav_sync1_1_4.jar
	install -Dm755 $srcdir/webdav-sync "${pkgdir}"/usr/bin/webdav-sync
}

