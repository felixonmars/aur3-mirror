# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=htun
pkgver=0.9.6
pkgrel=1
pkgdesc="Creates a virtual IP network over HTTP by encapsulating IP traffic into valid HTTP requests"
arch=('i686' 'x86_64')
url="http://linux.softpedia.com/get/System/Networking/HTun-14751.shtml"
license=('GPL')
backup=('etc/htund.conf')
source=("http://www.sourcefiles.org/Networking/Tools/Proxy/$pkgname-$pkgver.tar.gz"
        'include-and-static-updates.patch'
        'htund')
md5sums=('76226191f9020520fbaa480d1d428c2d'
         'ad23071a6d2481c3a7d632c3a625f2bb'
         '113c2a9f2ad15962bc975e35eaaf0ae6')

build() {
 cd "$srcdir/$pkgname-$pkgver/src"
 patch -d .. -p0 < "$srcdir/include-and-static-updates.patch"
 make
}

package() {
 install -Dm 755 "$srcdir/$pkgname-$pkgver/src/htund" "$pkgdir/usr/bin/htund"
 install -Dm 644 "$srcdir/$pkgname-$pkgver/doc/htund.conf" "$pkgdir/etc/htund.conf"
 install -Dm 755 "$srcdir/htund" "$pkgdir/etc/rc.d/htund"

 for file in CHANGELOG FAQ README REPORTING-BUGS TODO; do
  install -Dm 644 "$srcdir/$pkgname-$pkgver/doc/$file" "$pkgdir/usr/share/$pkgname/$file"
 done
}
