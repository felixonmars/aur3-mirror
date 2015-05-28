# Maintainer: jfperini <@jfperini>
# Contributor: jfperini <@jfperini>

pkgname=cirkuit-git
pkgver=0.4.2+r381.855b91c
pkgrel=1
pkgdesc="Cirkuit is a KDE4 GUI for the Circuit macros by Dwight Aplevich, for drawing high-quality line diagrams to include in TeX, LaTeX, for similar documents."
url="http://wwwu.uni-klu.ac.at/magostin/cirkuit.html"
license=('GPL v2')
arch=('any')
depends=('kdebase-runtime' 'texlive-core' 'ktikz' 'dpic' 'pdf2svg' 'm4' 'ghostscript' 'texlive-pstricks' 'netpbm' 'poppler-qt')
makedepends=('git' 'cmake' 'automoc4')
optdepends=('gnuplot: Gnuplot backend')
conflicts=('cirkuit')
provides=('cirkuit')
source=("$pkgname"::'git+http://anongit.kde.org/cirkuit')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {

    cd "$srcdir/$pkgname/"
    
    # Use the tag of the last commit
    printf "0.4.2+r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    
}



build() {

    cd "$srcdir/$pkgname"
  
    rm -rf build
    mkdir  build
    
    cd build
    
    msg2 "  -> Build program..."
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=qmake4
    make clean 
    make
  
}



package() {

    cd "$srcdir/$pkgname/build"
  
    msg2 "  -> Installing program..."
    make DESTDIR=$pkgdir install
  
    # rm -rf $pkgdir/usr/share/apps/katepart/syntax/gnuplot.xml
}

# vim: ts=2 sw=2 et: