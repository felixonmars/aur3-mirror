
# Contributor: Cyril Lashkevich <notorca@gmail.com>

pkgname=kscope
pkgver=1.9.4
pkgrel=2
pkgdesc="KDE Frontend to Cscope "
url="http://kscope.sourceforge.net/"
license="GPL"
depends=('cscope' 'ctags' 'graphviz' 'qscintilla')
source=(http://puzzle.dl.sourceforge.net/sourceforge/kscope/$pkgname-$pkgver.tar.gz)
md5sums=('b4a8a4249fa4fe0472e445f073a7a353')
arch=("i686" "x86_64")
build() {
    cd $startdir/src/$pkgname-$pkgver
    sed -i "s,INSTALL_PATH[ ]*=.*,INSTALL_PATH=${pkgdir}/usr," config	
    echo "CONFIG += ordered" >> kscope.pro 
    qmake || return 1 
    make || return 1
    make DESTDIR=$startdir/pkg install
} 

