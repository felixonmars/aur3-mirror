# Maintainer: Alasdair Haswell <ali at arhaswell dot co dot uk>

pkgname=cloudkick-config
pkgver=1.0.4
pkgrel=1
pkgdesc="Cloudkick agent initial configuration"
arch=('i686' 'x86_64')
url="http://www.cloudkick.com"
license=('custom: "commercial"')

case "$CARCH" in
    i686) _arch='i386';;
    x86_64) _arch='amd64';;
    # The following should not happen; provided you're using 'makepkg' ;)
    *) error "Unknown or invalid CARCH=$CARCH"; exit 1
esac

source=(http://packages.cloudkick.com/releases/cloudkick-config/binaries/$pkgname-$pkgver\_${_arch}.tar.gz)
sha256sums=('30e521c1f263e071eba63e56b2159123f8530f68e9249496f24992bc24ae9de7')
[ "${_arch}" = 'i386' ] && sha256sums[0]='a59ce036b8fb9deabd6cdc687dc32e1c30201a411b6cdcb80bc1ca41c60657f9'

package() {
  mkdir -p $pkgdir/usr/bin
  cp -v $srcdir/src/cloudkick-config $pkgdir/usr/bin
}
