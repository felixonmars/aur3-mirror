# Maintainer: Chris Fordham <chris.fordham@rightscale.com>

pkgname=rightscale-monit
pkgver=5.0.3
pkgrel=2
pkgdesc='RightScale RightLink monit support.'
arch=('i686' 'x86_64' 'armv6h')
url="http://mmonit.com/monit/"
license=('GPL3')
depends=(openssl)
makedepends=(flex bison)
conflicts=()
options=()
source=(
	https://s3.amazonaws.com/rightscale-oss-temp/monit-5.0.3.tar.gz					# need to confirm if this is standard monit 5.0.3 from upstream or forked
	monitrc
)
md5sums=('dae7859ec10551fc941daeae60dee9d3'
         'ef76b619fe8881e35f2b69c0be4cdd9f')        # generate with 'makepkg -g'

_rs_prefix="/opt/rightscale"
_sandbox_dir="${_rs_prefix}/sandbox"

build() {
	cd "$srcdir/monit-$pkgver"
	
	autoconf
	./configure --prefix="${_sandbox_dir}"
	make
}

package() {
	cd "$srcdir/monit-$pkgver"
	make DESTDIR=${pkgdir} install
	
	msg 'Install monitrc into package...'
	install -D -m700 "$startdir/monitrc" "$pkgdir/$_rs_prefix/etc/monitrc"
	
	msg 'Adding monit directories to package...'
	mkdir -p "$pkgdir/opt/rightscale/var/run"
	mkdir -p "$pkgdir/opt/rightscale/var/lib/monit"
	mkdir -p "$pkgdir/opt/rightscale/etc/monit.d"
}

# vim:syntax=sh