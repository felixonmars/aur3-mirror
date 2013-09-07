# This PKGBUILD is for the updater/launcher of the game
# You need to extract (ar x) the data.tar.bz2 from the
# .deb file of your relevant architecture to build this
# package. Please notify the current maintainer of any
# new versions.


# THIS PACKAGE DOES NOT INCLUDE THE DATA, you still have
# buy the game in order to build it

pkgname=battleworlds-launcher
_pkgname=battle-worlds-kronos
__pkgname=battleworldskronos
pkgver=0.1b
pkgrel=2
pkgdesc="A launcher for the Battle Worlds Kronos game"
arch=("i686" "x86_64")
url="http://battle-worlds.com/"
license=('custom:commercial')
depends=('python' 'qt4' 'qtwebkit' 'xdelta3' 'gksu' 'xdg-utils' 'quazip' 'python-setuptools')
source=(battleworlds.install
        data.tar.bz2)
install=battleworlds.install

sha512sums=('0aab2a4f62ddf9a7ca7f8030069e6d6045458f2596259c42f330d4d17ee759910309ff61e95f5ece9cc1f5b14dce6a7ab1295f77192193543181c12677f0f708')

if test "$CARCH" == x86_64; then
  sha512sums+=('dd177d146834fc35ef383c7490accd2876a9af4b13d6e9f4733699a3c7015fab367a5befb0783374a6b1e9b8d344b0a49357beccb901acf82eba6dd8a7c0eb85')
elif test "$CARCH" == i686; then
  sha512sums+=('63c19d6af6fd3cc7f51e20ee17b0ddb53e68849627f8760d41b1e5c002fd982534e6e0ad257f3dc280af8edc16edcd60aed9f5643e7aa3fc0f6e29aabc8c523e')
fi

package() {
    # install bwk_lib to the current python setup
    pythonver=$(python3 -V 2>&1| cut -d " " -f 2 | cut -d . -f 1-2)
    mkdir -p "$pkgdir/usr/lib/python$pythonver/site-packages/"
    mv "$srcdir/usr/lib/python3/dist-packages/bwk_lib.py" "$pkgdir/usr/lib/python$pythonver/site-packages"
    rm -rv "$srcdir/usr/lib/python3"

    # install the licence files
    mkdir -p "$pkgdir/usr/share/licenses/$_pkgname"
    install -m644  "$srcdir"/usr/share/doc/$_pkgname/{copyright,eula.txt} "$pkgdir/usr/share/licenses/$_pkgname/"

    mkdir -p "$pkgdir/usr/bin/"
    install -m755 "$srcdir/usr/games/$__pkgname" "$pkgdir/usr/bin/$__pkgname"

    cp -rvf "$srcdir/usr" "$pkgdir"
}
