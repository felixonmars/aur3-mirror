# Contributor: nat1192	<nat1192@gmail.com>

pkgname=ktigcc-cvs
pkgver=20090525
pkgrel=1
pkgdesc="an IDE for the tigcc cross-toolchain (Now with KDE4 support)"
license=('GPL2')
depends=("tigcc" "libticalcs" "kdelibs" "kdebase" "qt4")
source=('http://downloads.sourceforge.net/sourceforge/tigcc-linux/ktigcc-completion-data-0.96b08r1-1.tar.bz2' 
'ktigcc-20090525.tar.bz2' 'ktigcc.desktop')
url="http://tigcc.ticalc.org/linux/"
arch=(i686)
md5sums=('15b40d46daaaa3d3ca5ef6f295b69bb9'
         'e553da400b101d73737077fe5e7fb32e'
         'dc3c3d613c5a83276ec6be67f482c8b1')
build() {
    echo $startdir
    cd $startdir/src/ktigcc
    ./configure || return 1
    make clean
    make || return 1
    make INSTALL_ROOT=$startdir/pkg install

    # Install menu entry
    install -m 644 -D images/ktigcc.png $startdir/pkg/usr/share/pixmaps/ktigcc.png
    install -m 644 -D $startdir/ktigcc.desktop $startdir/pkg/usr/share/applications/ktigcc.desktop
    
    #Install completion data
    install -m 644 -D $startdir/src/completion $startdir/pkg`kde4-config --expandvars --install data`/ktigcc/completion
}
