# Contributor: Gabriel Peixoto <gabrielrcp@gmail.com>
# Contributor: J. W. Birdsong <jwbirdsong AT gmail DOT com>
# Contributor: Ricky Kresslein <rkresslein@gmail.com>
pkgname=blogbridge
pkgver=6.7
pkgrel=2
pkgdesc="For true info-junkies who want a better way to wrangle all their RSS feeds from blogs and news into one pretty cool organizer."
arch=('i686' 'x86_64')
url="http://www.blogbridge.com/"
	license=('GPL')
depends=('java-runtime')
source=("https://s3-us-west-2.amazonaws.com/blogbridge/blogbridge-${pkgver}.tgz"
        'blogbridge.sh'
        'blogbridge.desktop')
sha256sums=('986b0f9ca0b30997ccbf0b5f54b419e3856522d16433490b6e69d2374566bb41'
            'a647fc2face02151a52e85d170c462b6ec0541226ad88148b3b09b693d0c479b'
            '75f349fc5290c02ee111fc3bd701a34fb01a4685de828ee3fcf5293c39b53d07')

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/share/java/$pkgname"
    rm -f $pkgname-$pkgver/blogbridge.{bat,sh}
    cp -f $pkgname-$pkgver/*.jar "$pkgdir/usr/share/java/$pkgname"
    cp -f $pkgname-$pkgver/lib/*.jar "$pkgdir/usr/share/java/$pkgname"
    
    install -m755 -D blogbridge.sh "$pkgdir/usr/bin/blogbridge"
    
    install -m644 -D $pkgname-$pkgver/blogbridge.gif "$pkgdir/usr/share/pixmaps/blogbridge.gif"
    install -m644 -D blogbridge.desktop "$pkgdir/usr/share/applications/blogbridge.desktop"
}

