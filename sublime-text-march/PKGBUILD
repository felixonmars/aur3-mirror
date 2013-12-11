pkgname=sublime-text-march
pkgver=3057
pkgrel=1
pkgdesc="Sophisticated text editor for code, html and prose - dev"
arch=('i686' 'x86_64')
url="http://www.sublimetext.com/3"
license=('custom')
depends=(libpng gtk2)
install=${pkgname}.install

_archurl=x64

[[ "$CARCH" == i686 ]] && _archurl=x32

source=(
"http://c758482.r82.cf2.rackcdn.com/sublime_text_3_build_${pkgver}_${_archurl}.tar.bz2"
)
md5sums=('68df8f462aefb707c1e8dfbda4342c4a')

[[ "$CARCH" == i686 ]] && md5sums[0]='6da67aad9448034e654a22d5363c51af'

package() {
    install -dm755 "$pkgdir/opt"
    xxd -p "$srcdir/sublime_text_3/sublime_text" | tr -d '\n' > "$srcdir/sublime_text_3/patch"
    sed -i "s/433333423032/433332423032/g" "$srcdir/sublime_text_3/patch"
    xxd -p -r "$srcdir/sublime_text_3/patch" "$srcdir/sublime_text_3/sublime_text"
    cp --preserve=mode -r "$srcdir/sublime_text_3" "$pkgdir/opt/sublime_text_3"

    for res in 128x128 16x16 256x256 32x32 48x48; do
        install -dm755 "$pkgdir/usr/share/icons/hicolor/$res/apps"
        ln -s "/opt/sublime_text_3/Icon/$res/sublime-text.png" "$pkgdir/usr/share/icons/hicolor/$res/apps/sublime-text.png"
    done

    install -dm755 "$pkgdir/usr/share/applications"
    ln -s "/opt/sublime_text_3/sublime_text.desktop" "$pkgdir/usr/share/applications/sublime_text_3.desktop"

    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/sublime_text_3/sublime_text" "$pkgdir/usr/bin/subl3"
}
