# Maintainer: Yi Dai <plmday_at_gmail_dot_com>

pkgname=dlv-noodbc
pkgver=2012.12.17
pkgrel=1
pkgdesc="DLV is a deductive database system, based on disjunctive logic programming, which offers front-ends to several advanced KR formalisms. This is the statically linked binary without ODBC support."
arch=('i686' 'x86_64')

case $CARCH in
  'i686')
    md5sums=('0220409fcc45ab4a07bd43898736d9f5'
             '580715a9b6016472ba75b421dd75c4a8')
    _arch='i386' ;;
  'x86_64')
    md5sums=('5df55440031c7060f95d5e881e376378'
             '580715a9b6016472ba75b421dd75c4a8')
    _arch='x86-64' ;;
esac

url="http://www.dlvsystem.com/dlv/"
license=('custom')
source=("http://www.dlvsystem.com/files/dlv.${_arch}-linux-elf-static.bin"
        LICENSE)

package() {
  install -D -m755 dlv.${_arch}-linux-elf-static.bin "$pkgdir/usr/bin/dlv"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

