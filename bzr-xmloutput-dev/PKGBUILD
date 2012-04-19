# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
# Contributor: Matthias Maennich <arch@maennich.net>
pkgname=bzr-xmloutput-dev
pkgver=164
pkgrel=1
pkgdesc="A Bazaar plugin that provides a option to generate XML output for builtins commands (Development version)"
arch=('i686' 'x86_64')
url="https://launchpad.net/bzr-xmloutput"
license=('GPL2')
depends=('bzr')
conflicts=('bzr-xmloutput')
replaces=()
provides=('bzr-xmloutput=0.8.8')
makedepends=('python2' 'bzr')
source=()
md5sums=()
sha1sums=()

_bzrmod=bzr-xmloutput
_bzrtrunk=lp:bzr-xmloutput

build() {

	cd $srcdir

	msg "Connecting to Bazaar server...."

	if [[ -d "$_bzrmod" ]]; then
		cd "$_bzrmod" && bzr pull "$_bzrtrunk" -r "$pkgver"
		msg "The local files updated"
	else
	        bzr branch "$_bzrtrunk" "$_bzrmod" -q -r "$pkgver"
	fi

	msg "Bazaar checkout done or server timeout"
	msg "Starting build..."


	rm -rf "$srcdir/$_bzrmod-build"
	cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
	cd "$srcdir/$_bzrmod-build"

	python2 setup.py install --prefix=/usr --root="$pkgdir"
}

