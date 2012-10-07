# Maintainer: Daniel Beecham <daniel@lunix.se>

pkgname=liblzma
pkgver=5.0.4
pkgrel=1
pkgdesc="lzma libraries and header files" # Should be separated into liblzmalib
arch=('i686', 'x86_64')
url="http://tukaani.org/xz"
license="custom"

source="$url/xz-$pkgver.tar.gz"
md5sums="df3df690aef18384e1e031be7ec3a964"

build() {
    echo $srcdir
    cd $srcdir/xz-$pkgver
    ./configure --prefix=/usr --enable-small --disable-xz --disable-xzdec --disable-lzmadec --disable-lzmainfo --disable-lzma-links --disable-scripts 
    cd src/liblzma
    make
}

package() {
    cd $srcdir/xz-$pkgver/src/liblzma
    make DESTDIR="$pkgdir/" install

    mkdir -p $pkgdir/usr/share/licences/$pkgname
    echo "liblzma is in public domain. You can do whatever you want with it." >> $pkgdir/usr/share/licences/$pkgname/licence
}
