# Maintainer: Emmanuel GAUDE <gaude.emmanuel@gmail.com>

pkgname="brother-mfc-j5910dw-lpr"
pkgver=1.1.3
_revision=1
pkgrel=1
pkgdesc="LPR driver for the Brother MFC-J5910DW printer"

url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html#MFC-J5910DW"
license=('custom:brother_eula')

source=("http://www.brother.com/pub/bsc/linux/dlf/mfcj5910dwlpr-${pkgver}-${_revision}.i386.deb"
        'LICENSE')
md5sums=('e7fa39caaa39079a5b3598f2919e7bde' '78f626fac3772c42f9d2de3ffe128469')
arch=('i686' 'x86_64')
if [ "$CARCH" = "i686" ]; then
    depends=('glibc' 'sh')
else
    depends=('lib32-glibc' 'sh')
fi
optdepends=("brother-mfc-j5910dw-cupswrapper: For printing via CUPS.")

package() {
  cd $srcdir
  ar x mfcj5910dwlpr-${pkgver}-${_revision}.i386.deb || return 1
  tar -xzvf $srcdir/data.tar.gz -C $pkgdir || return 1

  cd $startdir
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || return 1
}

# vim:set ts=2 sw=2 et:
