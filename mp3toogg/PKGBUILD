    # Contributor: David Marcon <davidmrc@gmail.com>

    pkgname=mp3toogg
    pkgver=2.0
    pkgrel=3
    pkgdesc="mp3 to ogg format converter"
    arch=('i686')
    url="http://sourceforge.net/projects/mp3toogg/"
    depends=('mpg123' 'vorbis-tools' 'mp3info' 'zenity')
    license=('GPL')
    source=(http://downloads.sourceforge.net/sourceforge/mp3toogg/mp3toogg-2.0.tar.gz)
    md5sums=('9385153067fbccda4cd7d182160f5dfe')

    build() {
    cd $srcdir/${pkgname}-${pkgver}
    MPG321=/usr/bin/mpg123 ./configure -prefix=/usr
    make || return 1
    make DESTDIR="$pkgdir/" install
    }
