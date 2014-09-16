# Maintainer: SataMaxx <maximewack(a)free(dot)fr>
# Contributor: Jose Negron <josenj.arch@mailnull.com>
# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>
pkgname=wxformbuilder-dev
pkgver=3.5.0beta
pkgrel=1
pkgdesc="Designer, GUI Builder, and RAD Tool For wxWidgets"
arch=('i686' 'x86_64')
depends=('wxgtk')
makedepends=('wxgtk')
source=(http://downloads.sourceforge.net/project/wxformbuilder/wxformbuilder-nightly/3.5.0-beta/wxFormBuilder_v3.5.0-beta-source.zip 
        $pkgname.desktop )
url="http://wxformbuilder.org"
license=("GPL")
provides=(wxformbuilder)
conflicts=(wxformbuilder)
md5sums=('687cef17f99cbaf782998a2e6bd1d709'
         'c3ce13fb9a78bf668def73a1f37d5c38')

build() {
    cd $srcdir/source
    
    tr -d '\r' < create_build_files4.sh > create_build_files_unix.sh		#convert from win to unix format
    chmod +x create_build_files_unix.sh

    ./create_build_files_unix.sh
    
    cd build/3.0/gmake
    make config=release
    
    cd $srcdir/source/output
    rm share/wxformbuilder
    rm share/README.txt
    
    mkdir -p share/wxformbuilder
    mv xml share/wxformbuilder
    mv resources share/wxformbuilder
    mv plugins share/wxformbuilder
}

package() {
    mkdir -p $pkgdir/usr
    
    cd $srcdir/source/output
    
    rm Changelog.txt
    rm license.txt
    mv * $pkgdir/usr

    install -Dm 644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
