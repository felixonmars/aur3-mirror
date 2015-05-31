# Maintainer: Justin Dray <justin@dray.be>

_gitname=influxdb-collectd-proxy
pkgname=${_gitname}-git
pkgver=r49.ce3b049
pkgrel=1
pkgdesc="A very simple proxy from collectd to influxdb."
arch=('i686' 'x86_64')
url="https://github.com/hoonmin/influxdb-collectd-proxy"
license=('GPL')
backup=("etc/conf.d/${_gitname}.conf")
makedepends=('git'
             'go'
	     'godep')
source=("git+https://github.com/hoonmin/influxdb-collectd-proxy.git"
        "influxdb-collectd-proxy.service"
	"influxdb-collectd-proxy.conf")
md5sums=('SKIP'
         'ba5bec0cedbe954915310d38e2d74d96'
         'fe077b36cdefb0641862c4859fa96574')

 pkgver() {
	 cd "${srcdir}/${_gitname}"
	 ( set -o pipefail
	 git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	 )
 }


build() {
	cd "${srcdir}/${_gitname}"
	export GOPATH=$(pwd)
	godep restore
	make
}

package() {
	cd "${srcdir}/${_gitname}"
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/lib/systemd/system" "$pkgdir/etc/conf.d"
	install -Dm755 "$srcdir/${_gitname}/bin/${_gitname}" "$pkgdir/usr/bin/"
	install -Dm644 "$srcdir/${_gitname}.service" "$pkgdir/usr/lib/systemd/system/${_gitname}.service"
	install -Dm644 "$srcdir/${_gitname}.conf" "$pkgdir/etc/conf.d/${_gitname}.conf"
}
