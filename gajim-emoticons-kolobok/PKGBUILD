# Contributor: Ivan Omelchenko <zlordus@gmail.com>

pkgname=gajim-emoticons-kolobok
pkgver=1.1
pkgrel=2
pkgdesc="Kolobok for Gajim"
arch=('i686' 'x86_64')
url="http://www.kolobok.us/"
license=('CUSTOM')
depends=(gajim)
makedepends=(unzip)
source=(http://www.kolobok.us/content_files/downloads/messengers/kolobok_for_gajim_big_pack.zip
        emoticons.py)
md5sums=('b6931ee971356bda8cba51369c537b7e'
         '1d57fc6f39f1acf7725bcfed7b8f50cc')
         
build() {
    mkdir -p $pkgdir/usr/share/gajim/data/emoticons/kolobok
    mkdir -p $pkgdir/usr/share/licenses/gajim-emoticons-kolobok    
    
    install -m 644 $startdir/src/Copyright_en.txt $startdir/pkg/usr/share/licenses/gajim-emoticons-kolobok/Copyright.txt
    cd $pkgdir/usr/share/gajim/data/emoticons/kolobok
    tar xjf $srcdir/Kolobok_for_Gajim.tar.bz2
    cp -f $srcdir/emoticons.py .
    chown root:root $pkgdir -R
}
