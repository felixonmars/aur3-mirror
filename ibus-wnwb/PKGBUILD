# Contributor: age <jhswx84.gmail.com>

pkgname=ibus-wnwb
pkgver=0.1.1
pkgrel=1
pkgdesc="WanNengWubi for IBUS"
arch=(any)
url="http://blog.linuxeden.com/iframe.php?uid=225479"
license=('GNU Lesser General Public License')
makedepends=('ibus' 'ibus-table')
depends=('ibus' 'ibus-table')
source=('http://forum.ubuntu.org.cn/download/file.php?id=83739')
md5sums=('41d7561e68f8d5bf0eb2a5e49e437c9e')
_prefix=../pkg/usr/share/ibus-table
build(){
    cd $startdir/src
    ibus-table-createdb -s wnwb.txt
    mkdir -p $_prefix/tables/
    mkdir -p $_prefix/icons/
    install -Dm644 wnwb.db $_prefix/tables/wnwb.db
    install -Dm644 wnwb.svg $_prefix/icons/wnwb.svg
}

