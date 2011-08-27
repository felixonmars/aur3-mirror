# Maintainer: SataMaxx <maximewack(a)free(dot)fr>
# Contributor: Jose Negron <josenj.arch@mailnull.com>
# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>
pkgname=wxformbuilder
pkgver=3.1.70
pkgrel=1
pkgdesc="Designer, GUI Builder, and RAD Tool For wxWidgets"
arch=('i686' 'x86_64')
depends=('wxgtk')
makedepends=('wxgtk')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/wxFormBuilder_v$pkgver-src.tar.bz2 $pkgname.desktop )
url="http://wxformbuilder.org"
license=("GPL")
md5sums=('1c2d53a344333bd2389f9f07a5321d5e'
         'c9aff47b62355e358560805cd9579205')

build() {
    cd $srcdir/$pkgname
    
    tr -d '\r' < create_build_files.sh > create_build_files_unix.sh		#convert from win to unix format
    chmod +x create_build_files_unix.sh

    ./create_build_files_unix.sh
    make
    
    cd output
    rm share/wxformbuilder
    rm share/README.txt
    
    mkdir -p share/wxformbuilder
    mv xml share/wxformbuilder
    mv resources share/wxformbuilder
    mv plugins share/wxformbuilder
}

package() {
    mkdir -p $pkgdir/usr
    
    cd $srcdir/$pkgname/output
    
    rm Changelog.txt
    rm license.txt
    mv * $pkgdir/usr

    install -Dm 644 $srcdir/wxformbuilder.desktop $pkgdir/usr/share/applications/wxformbuilder.desktop
}
