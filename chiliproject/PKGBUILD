# Contributor: Dave Simons <miouhpi@gmail.com>

pkgname=chiliproject
pkgver=3.8.0
pkgrel=1
pkgdesc="Chiliproject is a fork of Redmine, a flexible project management web application written using Ruby on Rails."
arch=('any')
url="https://www.chiliproject.org"
license=('GPL2')
depends=('ruby' 'ruby-bundler' 'mysql' 'libxml2' 'libxslt' 'imagemagick' 'pkg-config')
provides=('chiliproject')
backup=('var/lib/chiliproject/config/database.yml'
       'var/lib/chiliproject/config/configuration.yml')
makedepends=('glibc')
optdepends=('git: Git repository browsing'
            'subversion>=1.3.0: Subversion repository browsing'
            'darcs: Darcs repository browsing'
            'bzr: Bazaar repository browsing'
            'mercurial: Mercurial repository browsing')
install=chiliproject.install
source=("https://www.chiliproject.org/attachments/download/427/chiliproject-$pkgver.tar.gz")
md5sums=('89cfad61b8918156a6ed5bcaefb66f76')


package() {
	cd "$srcdir/chiliproject-$pkgver"

	# install in /var/lib
	_instdir="$pkgdir/var/lib/chiliproject"
	mkdir -p ${_instdir}
	cp -ra . ${_instdir}

	# create required directories
	mkdir -p "${_instdir}/public/plugin_assets"
}

# vim:set ts=4 sw=4 et:
