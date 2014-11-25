# Maintainer: Yi Dai <plmday_at_gmail_dot_com>

pkgname=dlv-odbc
pkgver=2012.12.17
pkgrel=1
pkgdesc="DLV is a deductive database system, based on disjunctive logic programming, which offers front-ends to several advanced KR formalisms. This is the dynamically linked binary with ODBC support."
arch=('i686' 'x86_64')

case $CARCH in
  'i686')
    md5sums=('4eff686492e3606571202350798db800'
             '580715a9b6016472ba75b421dd75c4a8')
    _arch='i386' ;;
  'x86_64')
    md5sums=('154c559e1ceb8dcfb536c39a83294eb6'
             '580715a9b6016472ba75b421dd75c4a8')
    _arch='x86-64' ;;
esac

url="http://www.dlvsystem.com/dlv/"
license=('custom')
depends=('unixodbc')
install=dlv-odbc.install
source=("http://www.dlvsystem.com/files/dlv.${_arch}-linux-elf-unixodbc.bin"
        LICENSE)

package() {
  install -D -m755 dlv.${_arch}-linux-elf-unixodbc.bin "$pkgdir/usr/bin/dlv"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

