# Contributor: Jaroslaw Rosiek <philosoph@interia.pl>
pkgname=cc65-atari-libs
pkgver=2.11.0
pkgrel=1
pkgdesc="CC65 libraries needed to compile programs for Atari"
depends=()
url="http://www.cc65.org/"

source=( \
    ftp://ftp.musoftware.de/pub/uz/cc65/cc65-atari-2.11.0-1.zip )

build() {
    cd $startdir/src/

    _dest=$startdir/pkg/usr/share/cc65/

    mkdir -p $_dest/data/lib $_dest/data/joy
    
    for n in joy lib; do
       mv $n/* $_dest/data/$n/
    done

}

md5sums=('db239ba36fb639f5ff1782c9ff21a8a3')
