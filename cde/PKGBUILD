# Maintainer:  Bartlomiej Piotrowski <nospam@bpiotrowski.pl
# Contributor: Patrick Palka <patrick@parcs.ath.cx>

pkgname=cde
pkgver=2011.08.15
pkgrel=1
pkgdesc='Automatically create portable Linux applications'
url='http://www.stanford.edu/~pgbovine/cde.html'
arch=('i686' 'x86_64')
license=('BSD')

if [ "$CARCH" = "i686" ]; then
    _arch=32bit
    source=(https://github.com/downloads/pgbovine/CDE/${pkgname}_${pkgver//./-}_${_arch})
    md5sums=('835a779a66ab4f15da5d33bedffb5934')
else
    _arch=64bit
    source=(https://github.com/downloads/pgbovine/CDE/${pkgname}_${pkgver//./-}_${_arch})
    md5sums=('8dd2ae69a255aa6e80a3d0d111d660bc')
fi

package() {
    cd $srcdir
    install -Dm755 ${pkgname}_${pkgver//./-}_${_arch} $pkgdir/usr/bin/cde
}
