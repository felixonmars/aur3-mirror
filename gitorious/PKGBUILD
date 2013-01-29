# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=gitorious
pkgver=2.4.6
pkgrel=1
pkgdesc="Gitorious aims to provide a great way of doing distributed opensource code collaboration."
arch=(i686 x86_64)
url="http://gitorious.org/gitorious"
license=('AGPLv3')

depends=('sphinx' 'mysql' 'ruby-enterprise' 'ruby-enterprise-raspell' 'ruby-enterprise-bundler' 'imagemagick' 'nodejs-buster' 'libxslt')
makedepends=('git')
optdepends=(
	'memcached: High performance cache'
	'redis: message queue'
	'apollo: message queue'
	'apache-activemq: message queue'
	'ruby-enterprise-stompserver: message queue'
)
options=('!strip')

install=gitorious.install
backup=(etc/webapps/gitorious/broker.yml etc/webapps/gitorious/database.yml etc/webapps/gitorious/gitorious.yml)

source=(gitorious-daemon.rc.d gitorious-poller.rc.d gitorious-ultrasphinx.rc.d gitorious-resque-worker.rc.d database.yml gitorious.yml sphinx-cmd.patch)

_gitroot="git://gitorious.org/gitorious/mainline.git"

build() {
	cd "$srcdir"

	# trick systemtimer build system into thinking we have gcc-4.6
	rm -rf gcc46-pathfix
	mkdir gcc46-pathfix
	ln -s /usr/bin/gcc gcc46-pathfix/gcc-4.6
	export PATH="$PATH:$srcdir/gcc46-pathfix"

	if [ ! -d "$srcdir/$pkgname-$pkgver" ]; then
		msg "Connecting to GIT server...."
		git clone $_gitroot $pkgname-$pkgver
		cd $pkgname-$pkgver
		git checkout v$pkgver
		git submodule update --init
	fi

	msg "GIT checkout done or server timeout"

	rm -rf "$srcdir/$pkgname-build"
	cp -r "$srcdir/$pkgname-$pkgver" "$srcdir/$pkgname-build"
	cd "$srcdir/$pkgname-build/"
	rm -rf .git
	find . -type f -name .gitignore -delete

	msg "Fetching bundled gems..."
	/opt/ruby-enterprise/bin/bundle install --deployment --binstubs
	rm -rf vendor/bundle/ruby/*/cache

	msg "Patching application..."
	# Activate production mode
	sed -i "s|^# ENV\['RAILS_ENV'\]|ENV['RAILS_ENV']|" config/environment.rb

	patch -p1 -i "$srcdir/sphinx-cmd.patch"

	find bin script data/hooks -type f -exec sed -i 's|^#!/usr/bin/env ruby|#!/opt/ruby-enterprise/bin/ruby|' {} \;
}

package() {
	cd "$srcdir"

	_gitorious="/usr/share/webapps/gitorious"
	_etc="$pkgdir/etc/webapps/gitorious"
	install -d "$pkgdir/usr/share/webapps"
	install -d "$_etc"

	mv "$pkgname-build" "${pkgdir}${_gitorious}"

	install -D -m0644 "$srcdir/database.yml" "$_etc/database.yml"
	install -D -m0644 "$srcdir/gitorious.yml" "$_etc/gitorious.yml"
	install -D -m0644 "${pkgdir}${_gitorious}/config/broker.yml.example" "$_etc/broker.yml"

	ln -s "/etc/webapps/gitorious/database.yml" "${pkgdir}${_gitorious}/config/"
	ln -s "/etc/webapps/gitorious/gitorious.yml" "${pkgdir}${_gitorious}/config/"
	ln -s "/etc/webapps/gitorious/broker.yml" "${pkgdir}${_gitorious}/config/"

	install -d "$pkgdir/usr/bin"
	ln -s "${_gitorious}/script/gitorious" "$pkgdir/usr/bin/gitorious"

	# capillary
	ln -s /usr/lib/node_modules/buster/node_modules/ "${pkgdir}${_gitorious}/public/javascripts/lib/capillary/node_modules"

	install -D -m0755 "$srcdir/gitorious-daemon.rc.d" "$pkgdir/etc/rc.d/gitorious-daemon"
	install -D -m0755 "$srcdir/gitorious-poller.rc.d" "$pkgdir/etc/rc.d/gitorious-poller"
	install -D -m0755 "$srcdir/gitorious-resque-worker.rc.d" "$pkgdir/etc/rc.d/gitorious-resque-worker"
	install -D -m0755 "$srcdir/gitorious-ultrasphinx.rc.d" "$pkgdir/etc/rc.d/gitorious-ultrasphinx"

	# git data directories
	install -dm0750 "$pkgdir/var/git/repositories"
	install -dm0750 "$pkgdir/var/git/tarballs"
	install -dm0750 "$pkgdir/var/git/tarballs-work"
}

sha256sums=('040fdf9c9f9e39f5b0a8483befce74ed47750d813be421dd653393205f20b5c8'
            '7173bc21ed108831e95ced57e61edc3f7826ef4ea5f83cc4e192cda0f5e07046'
            '9a40370825620a6daa394b020cd745b6faafbe29d11c4722acb889ff097b9619'
            '0b48f79cbd64bf01bd6bad02c30ef51391040114479e24b772dceef91a60c19c'
            'd4cdb96e3d42ca7a9e143188dbf40751bd2bf7cdf29265c25bb18b4359ca470d'
            '5b899452fd992e8d8c622bc24ecccb948ec15e6f65556d0efa96c7a1f385f87a'
            '65be83bccf7d18ebe87efb2ab318cea3e9e79ac36fa16e3217b5ae2b92963f7e')
