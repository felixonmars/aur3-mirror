# Maintainer: Nicolas Leclercq <nicolas.private@gmail.com>

pkgname=facette
pkgver=20140512.6333414
_gitname='facette'
pkgrel=1
epoch=
pkgdesc='Facette is a software to display time series data from several various sources'
arch=('i686' 'x86_64')
url='http://facette.io/'
license=('BSD')
groups=()
depends=('go' 'rrdtool')
makedepends=('nodejs')
checkdepends=()
optdepends=()
provides=('facette')
conflicts=()
replaces=()
backup=()
options=()
install='facette.install'
changelog=
source=(
	"$_gitname::git://github.com/exzz/facette.git"
	'facette.service'
	'facette.install')
noextract=()
md5sums=(
	'SKIP'
	'd1e55b27ca233bba20d320113bc1a906'
	'ade342a98ade039939cf354580b12651')

pkgver() {
	cd "$srcdir/$_gitname"
	git log -1 --date=short --format="%cd.%h" | tr -d '-'
}

build() {
	cd ${_gitname}
	make dep build-bin build-static
}

package() {
	cd ${_gitname}
	make install-bin install-static

	# create target directory structure
	mkdir -p ${pkgdir}/{usr/bin,usr/share/facette,etc/facette,var/log/facette,var/run/facette}

	# copy binaries
	cp -r $srcdir/$_gitname/build/facette/bin/{facette,facettectl} ${pkgdir}/usr/bin
	cp -r $srcdir/$_gitname/build/facette/share/{html,static} ${pkgdir}/usr/share/facette

	# copy static content
	cp -r $srcdir/$_gitname/docs/examples/{auth.json,facette.json,origins} ${pkgdir}/etc/facette

	# copy systemd service file
	install -D -m644 $srcdir/facette.service $pkgdir/usr/lib/systemd/system/facette.service
}

