# Maintainer: Alasdair Haswell <ali at arhaswell dot co dot uk>

pkgname=cloudkick-agent
pkgver=0.9.18
pkgrel=1
pkgdesc="Cloudkick agent"
arch=('i686' 'x86_64')
url="http://www.cloudkick.com"
license=('custom: "commercial"')
depends=('cloudkick-config')

case "$CARCH" in
    i686) _arch='i386';;
    x86_64) _arch='amd64';;
    # The following should not happen; provided you're using 'makepkg' ;)
    *) error "Unknown or invalid CARCH=$CARCH"; exit 1
esac

source=(http://packages.cloudkick.com/releases/cloudkick-agent/binaries/$pkgname-$pkgver\_${_arch}.tar.gz
	cloudkick-agentd
	cloudkick-agent)
sha256sums=('02c3d38c378013552a3aade4d4ceab4d1de03591f9c27aa172a9c4e99d3ad8b5'
	    '3694dc0102df5801ab0491ceb49eea1fd6642138b6f5625f2f7454c036667e36'
	    '122342e2d1ba0d071a98075f4a9cf6ff00e895d04aee30ef9aa630dfb5aed270')
[ "${CARCH}" = 'i386' ] && sha256sums[0]='4c3a5589eecee9a25defa63d5068fef5e67f4e58ae0f13cba781e1b4e74fde25'

package() {
  mkdir -p $pkgdir/usr/sbin $pkgdir/usr/share/man/man8 $pkgdir/etc/logrotate.d $pkgdir/etc/rc.d
  cp -v $srcdir/cloudkick-agent $pkgdir/etc/logrotate.d/
  cp -v $srcdir/cloudkick-agentd $pkgdir/etc/rc.d/
  cp -v $srcdir/src/cloudkick-agent $pkgdir/usr/sbin/
  cp -v $srcdir/docs/cloudkick-agent.8.gz $pkgdir/usr/share/man/man8/
}
