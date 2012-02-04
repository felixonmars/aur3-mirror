# Contributor: Roberto Viola <cagnulein@tin.it>

pkgname=ipodtagger
pkgver=0.0.4
pkgrel=4
pkgdesc="A Perl script born to tag with lyrics and albumart your songs"
arch=('i686' 'x86_64')
license="GPL"
url="http://cagnulein.no-ip.info/wordpress/?cat=22"
depends=('mtag' 'perl-www-mechanize' 'perl-lyrics-fetcher' 'perl-soap-lite' 'perl-mp3-tag' 'perl-digest-sha1' 'perl-term-readkey')
source=(http://cagnulein.no-ip.info/iPodTagger/$pkgname-$pkgver.tar.gz)
md5sums=('d04422588862ac295dec43f4fe7ac4b6')

build() {       
        cd $startdir/src/$pkgname-$pkgver
        mkdir -p $startdir/pkg/usr/bin
        install -m 755 ipodtagger $startdir/pkg/usr/bin/ipodtagger
} 
