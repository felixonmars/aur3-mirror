pkgname="torque"
pkgver=5.1.0
pkgrel=1
buildnr="4048f77c"
pkgdesc='An open source resource manager providing control over batch jobs and distributed compute nodes'
arch=('i686' 'x86_64')
url="http://www.adaptivecomputing.com/products/open-source/torque/"
license=('GPL')
depends=('openssh' 'libxml2' 'tk')
makedepends=('make' 'gcc')
optdepends=()
backup=(var/spool/torque/server_name var/spool/torque/mom_priv/config var/spool/torque/serv_priv/{nodes,serverdb})
options=(!libtool)
install=torque.install
source=('http://www.adaptivecomputing.com/index.php?wpfb_dl=2868')
md5sums=('e9a1e4c2586c428af939b75af6ba2815')

build() {
	cd "$srcdir/$pkgname-$pkgver-${pkgrel}_$buildnr"
	CPPFLAGS="-DUSE_INTERP_ERRORLINE -DUSE_INTERP_RESULT" ./configure --prefix="/usr" --sbindir="/usr/bin"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver-${pkgrel}_$buildnr"
	make DESTDIR="$pkgdir/" install
}
