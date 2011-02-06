# Contributor: Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname=harvies-jukebox-svn
pkgver=5
pkgrel=1
pkgdesc="Simple PHP application acting as jukebox or music library. This allows you to stream or download your music many ways. Will be checked from SVN to /srv/http/h-jukebox. You will need some http server with PHP and do some settings in .php files. Then you can add symlink to your music collection in this application."
arch=('any')
license=('BSD')
url="http://code.google.com/p/h-jukebox/"
makedepends=('subversion')

_svntrunk="http://h-jukebox.googlecode.com/svn/trunk/"
_svnmod="h-jukebox-read-only"

build() {
  mkdir -p ${pkgdir}/srv/http/h-jukebox
	
	cd ${srcdir}
	svn checkout ${_svntrunk} ${_svnmod}
	
	cp -R ${srcdir}/${_svnmod}/* ${pkgdir}/srv/http/h-jukebox
	find ${pkgdir} -name .svn -print0 | xargs -0 rm -rf #remove .svn directories
	chmod -R 655 ${pkgdir}/
}
