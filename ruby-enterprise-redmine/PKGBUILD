# Maintainer: LeeF
# Contributor: BlaÅ¾ TomaÅ¾iÄ <blaz.tomazic@gmail.com>

pkgname=ruby-enterprise-redmine
pkgver=1.1.0
pkgrel=0
_realname=redmine
pkgdesc="Redmine is a flexible project management web application written using Ruby on Rails framework. This package is designed to use Enterprise Ruby and git repositories, other repository types should work."
arch=('i686' 'x86_64')
url="http://www.redmine.org/"
license=('GPL2')
depends=('ruby-enterprise' 'ruby-enterprise-rack-101' 'ruby-enterprise-rails-235' 'ruby-enterprise-i18n-040')
optdepends=('ruby-enterprise-rmagick' 'ruby-enterprise-mysql')
install=redmine.install
_rubyforge=73692
source=("http://rubyforge.org/frs/download.php/$_rubyforge/$_realname-$pkgver.tar.gz" redmine.install LeeF-Redmine.pm.patch)
md5sums=('f62dfacd937507093826202ca18cb5b5' '00b47779b759e7cbee553e862a5ca07f' '860f1b55b1eb4d3162195f526190339b')

build() {
	return 0
}

package() {
	cd "$srcdir/$_realname-$pkgver"

	#install in /usr/share/webapps/redmine
	_instdir="$pkgdir/usr/share/webapps/$_realname"
	mkdir -p ${_instdir}
	cp -ra . ${_instdir}
	
	# Apply patch for git-smart-http
	cd ${_instdir}
	patch -p0 < $srcdir/LeeF-Redmine.pm.patch 1>/dev/null

	# Delete files directory so it's not removed during uninstall
	rm -Rf ${_instdir}/files

	# Create needed dir
	mkdir -p "${_instdir}/public/plugin_assets"
}
