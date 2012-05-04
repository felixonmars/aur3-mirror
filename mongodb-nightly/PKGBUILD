pkgname=mongodb-nightly
pkgbasename=mongodb
pkgver=2012.05.04
_pkgdate='2012-05-04'
pkgrel=1
pkgdesc="A high-performance, open source, schema-free document-oriented database."
arch=('i686' 'x86_64')
url="http://mongodb.org"
license=('AGPL3')
depends=(boost-libs pcre)
optdepends=('libpcap: needed for mongosniff')
provides=('mongodb')
backup=('etc/conf.d/mongodb' 'etc/mongodb.conf')
conflicts=(mongodb)
source=("http://downloads.mongodb.org/linux/mongodb-linux-$CARCH-latest.tgz"
        "mongodb.rc"
        "mongodb.conf")

md5sums=('32dfe3378fad8c7190020f2f7f7b8783'
         '089892f44672eee186103867a787075e'
         '4839fe1d638187ca3226e8267b947318')
[ "$CARCH" = "i686" ] &&
md5sums=('3b62fb1f016ac5700448d9bbc2628522'
         '089892f44672eee186103867a787075e'
         '4839fe1d638187ca3226e8267b947318')
install="mongodb.install"

package() {
    install -d "$pkgdir/usr/bin"
    install -D $srcdir/mongodb-linux-$CARCH-${_pkgdate}/bin/* $pkgdir/usr/bin 
    install -Dm 755 "$startdir/mongodb.rc" "$pkgdir/etc/rc.d/mongodb"
    install -Dm 644 "$startdir/mongodb.conf" "$pkgdir/etc/mongodb.conf"
    install -dm 700 "$pkgdir/var/state/mongodb"

    if [ -d "$pkgdir/usr/lib64" ]
    then
        mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
    fi
}
