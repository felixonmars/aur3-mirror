# Maintainer: LeeF

pkgname=ruby-enterprise-redmine-gitosis
pkgver=01012011
pkgrel=0
_realname=redmine_gitosis
pkgdesc="This plugin allows redmine to use gitosis to create and control access to git repos, the repos are accessed via SSH using public keys."
arch=('i686' 'x86_64')
url="https://github.com/ericpaulbishop/redmine_gitosis"
license=('MIT')
depends=('ruby-enterprise-redmine' 'ruby-enterprise-net-ssh' 'ruby-enterprise-inifile' 'ruby-enterprise-lockfile')
install=redmine-gitosis.install
source=("http://opensource.errorcode420.com/$_realname/$_realname-$pkgver.tar.gz" redmine-gitosis.install)
md5sums=('5305d47490d1b1889153620c91de033b' '14aaccba36dc9341158c4808cde3fce5')

build() {
	return 0
}

package() {
	cd "$srcdir/$_realname"

	#install in /usr/share/webapps/redmine/vendor/plugins
	_instdir="$pkgdir/usr/share/webapps/redmine/vendor/plugins/$_realname"
	mkdir -p ${_instdir}
	cp -ra . ${_instdir}
}
