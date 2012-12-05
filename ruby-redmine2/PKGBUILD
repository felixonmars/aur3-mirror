pkgname=ruby-redmine2
pkgver=2.1.4
pkgrel=1
pkgdesc="Redmine is a flexible project management web application written using Ruby on Rails."
arch=any
url="http://www.redmine.org"
license=('GPL2')
depends=('ruby' 'ruby-bundler' 'dialog')
provides=('redmine')
makedepends=('glibc')
optdepends=('git: Git repository browsing'
            'subversion>=1.3.0: Subversion repository browsing'
            'darcs: Darcs repository browsing'
            'bzr: Bazaar repository browsing'
            'mercurial: Mercurial repository browsing'
			'sudo: Automated installation of missing packages')
options=()
install=ruby-redmine2.install
source=("http://rubyforge.org/frs/download.php/76589/redmine-$pkgver.tar.gz"
        "redmine2.service")
md5sums=('8d022c2ba2e0aeddc893249e015bddfc'
         'c31975df98abf11891bc1c3b95862c26')

build() {
	return 0
}

package() {
	_redmine_installation_path="/var/lib/redmine2"
	cd "$srcdir/redmine-$pkgver"

	# install in /var/lib
	_instdir="$pkgdir/${_redmine_installation_path}"
	mkdir -p ${_instdir}
	cp -ra . ${_instdir}

	# create required directories
	mkdir -p "${_instdir}/public/plugin_assets"

	# Create systemd service
	mkdir -p "$pkgdir/usr/lib/systemd/system/"
	install -m 644 "$srcdir/redmine2.service" "$pkgdir/usr/lib/systemd/system/"

	# Create redmine user home
	mkdir -p "${_instdir}/redmine/"
}

# vim:set ts=4 sw=4 et:
