# Maintainer: Dicebot <public@dicebot.lv>
pkgname=dstep-git
pkgver=168.e232b34
pkgrel=2
pkgdesc="Automatic C header to D module translator"
arch=('i686' 'x86_64')
url="https://github.com/jacob-carlborg/dstep"
license=('custom')
depends=('clang')
makedepends=('git' 'libtango2' 'dmd' 'dtools')
source=(
    "git+https://github.com/jacob-carlborg/dstep.git"
    "http://www.boost.org/LICENSE_1_0.txt"
)
sha1sums=(
    'SKIP'
    '3cba29011be2b9d59f6204d6fa0a386b1b2dbd90'
)

pkgver()
{
    cd dstep
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build ()
{
    cd dstep
    git submodule update --init --recursive
    rdmd --build-only -debug -gc -ofbin/dstep -Idstack/mambo -Idstack -I/usr/include/dlang -L-lclang -L-ltango2 dstep/driver/DStep.d
}

package ()
{
    mkdir -p $pkgdir/usr/bin
    install -m755 $srcdir/dstep/bin/dstep $pkgdir/usr/bin/dstep
    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    install -m644 $srcdir/LICENSE_1_0.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
