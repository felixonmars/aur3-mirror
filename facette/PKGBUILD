# Maintainer: Nicolas Leclercq <nicolas.private@gmail.com>

pkgname=facette
pkgver=0.2.1
pkgrel=1
epoch=
pkgdesc='Facette is a software to display time series data from several various sources'
arch=('i686' 'x86_64')
url='http://facette.io/'
license=('BSD')
groups=()
depends=('rrdtool')
makedepends=()
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
	"https://github.com/facette/facette/releases/download/$pkgver/$pkgname-$pkgver-linux-amd64.tar.gz"
	'facette.service'
	'facette.install'
  '.AURINFO')
noextract=()
md5sums=('9b2237e48530d6940b2d3357da594604'
         '0a15a3822fc2ee56a39971528284c9c6'
         'ade342a98ade039939cf354580b12651'
         'SKIP')

package() {
  cd "$srcdir/$pkgname-linux-amd64"

	# create target directory structure
	mkdir -p ${pkgdir}/{usr/bin,usr/local/share/facette,etc/facette,var/log/facette,var/run/facette}

	# binaries
	cp bin/{facette,facettectl} ${pkgdir}/usr/bin

  # static content
  cp -r share/facette/{examples,static,template} ${pkgdir}/usr/local/share/facette

  # man
  cp -r share/man ${pkgdir}/usr/local/share/facette

	# default config
	cp -r share/facette/examples/{facette.json,providers} ${pkgdir}/etc/facette

	# copy systemd service file
	install -D -m644 $srcdir/facette.service $pkgdir/usr/lib/systemd/system/facette.service
}

