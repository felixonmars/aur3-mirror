# Contributor: Ivan Omelchenko <zlordus@gmail.com>

pkgname=gajim-emoticons-kolobok-mini
pkgver=1.0
pkgrel=0
pkgdesc="Kolobok for Gajim (mini)"
arch=('i686' 'x86_64')
url="http://www.kolobok.us/"
license=('CUSTOM')
depends=(gajim)
makedepends=(unzip)
source=(http://www.kolobok.us/content_files/downloads/messengers/qip/mini_kolobok_for_qip.zip
        emoticons.py)
md5sums=('6bfbaed4d2839fe750d85f252264c74a'
         '343a6c192629e27aed55d2d23df5bbfe')
         
build() {
    mkdir -p $pkgdir/usr/share/gajim/data/emoticons/kolobok-mini
    mkdir -p $pkgdir/usr/share/licenses/gajim-emoticons-kolobok-mini    
    
    install -m 644 $startdir/src/Copyright_en.txt $startdir/pkg/usr/share/licenses/gajim-emoticons-kolobok-mini/Copyright.txt
    cd $pkgdir/usr/share/gajim/data/emoticons/kolobok-mini
    cp -f $srcdir/Kolobok\ Mini\ series/*.gif .
    cp -f $srcdir/emoticons.py .
}
