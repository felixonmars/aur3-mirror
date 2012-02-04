pkgname=python2.6
pkgver=2.6
pkgrel=4
pkgdesc="Python 2.6 - successor to 2.5 ^^"
arch=("i686" "x86_64")
url="http://www.python.org/download/releases/2.6/"
license=("custom")
depends=(bzip2 openssl tk sqlite3 gdbm)
makedepends=()
options=("!emptydirs")
source=(http://www.python.org/ftp/python/2.6/Python-2.6.tar.bz2)
md5sums=('837476958702cb386c657b5dba61cdc5')

build() {
    cd $startdir/src/Python-$pkgver
    [ `gcc --version | head -1 | awk '{print $3}'` = '4.3.0' ] && export CC="gcc $CFLAGS -fno-tree-vrp"
    ./configure --prefix=/usr --enable-shared --enable-ipv6
    make || return 1
    make DESTDIR=$startdir/pkg altinstall maninstall
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
    cd $pkgdir/usr
    #mv share/man/man1/python.1 share/man/man1/python3.1
    cd bin
    mv idle idle2.6
    mv pydoc pydoc2.6
    mv smtpd.py smtpd2.6.py
    #ln -s python3.0 python3
    #ln -s python3.0-config python3-config
}
# vim: ts=2
