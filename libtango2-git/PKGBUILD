# Maintainer: Dicebot <public@dicebot.lv>
pkgname=libtango2-git
pkgver=5792.667c566
pkgrel=2
pkgdesc="Port of Tango library for D programming language to version 2 of the language"
arch=('i686' 'x86_64')
url="http://www.dsource.org/projects/tango"
license=('BSD')
makedepends=('dmd' 'git' 'libphobos')
provides=('libtango2')
source=("git+https://github.com/SiegeLord/Tango-D2.git")
sha1sums=('SKIP')

pkgver()
{
    cd Tango-D2
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build ()
{
    cd Tango-D2
    ARCH=$CARCH make -f build/Makefile
}

package ()
{
    mkdir -p $pkgdir/usr/lib
    install -m644 $srcdir/Tango-D2/libtango-dmd.a $pkgdir/usr/lib/libtango2.a
    mkdir -p $pkgdir/usr/include/dlang/
    cp -r $srcdir/Tango-D2/import/tango $pkgdir/usr/include/dlang/tango
    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    install -m444 $srcdir/Tango-D2/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
