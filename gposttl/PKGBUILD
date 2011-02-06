# Contributor: John Kalantzis <ikalantzis@ceid.upatras.gr>

pkgname=gposttl
pkgver=0.9.2
pkgrel=1
pkgdesc="Brill's Parts-of-Speech Tagger, with built-in Tokenizer and Lemmatizer."
arch=('i686' 'x86_64')
url="http://gposttl.sourceforge.net/"
license=('Historical Permission Notice and Disclaimer')
source=("http://downloads.sourceforge.net/project/gposttl/gposttl/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('76f3ac61a58e6fd8bcc712b949e927aa')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    
    ./configure --prefix=/usr
    make || return 1
    make DESTDIR="$pkgdir/" install
    
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
