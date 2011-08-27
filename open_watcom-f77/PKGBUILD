# Adopted by: Jens Staal <staal1978@gmail.com>

pkgname=open_watcom-f77
pkgver=1.9.0
pkgrel=2
pkgdesc="The Open Watcom F77 compiler, binary distribution"
arch=("i686")
url="http://www.openwatcom.org"
license=('custom:OWPL-1')
source=("ftp://ftp.heanet.ie/pub/openwatcom/open-watcom-f77-linux-1.9")
md5sums=('8985018415fcdc90bab67d1b470f0fa2')

build() {
    export TERMINFO=/usr/lib/terminfo
    chmod 755 $srcdir/open-watcom-f77-linux-1.9

    install -d "$pkgdir/opt/watcom"
  msg "installer for F77 compiler will start ... choose $pkgdir/opt/watcom as destination directory"
    ./open-watcom-f77-linux-1.9
}

package() {
  install -d "$pkgdir/usr/share/licenses/watcom"
  install -Dm644 $pkgdir/opt/watcom/license.txt $pkgdir/usr/share/licenses/watcom/licence-f77.txt
}
