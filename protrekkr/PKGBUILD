pkgname=protrekkr
pkgver=1.98k_linux_svn_357
pkgrel=1
pkgdesc="Tracker program to create electronic music (like psytrance, trance goa, hard acid, IDM, chip, techno, etc.) for small sized intros, demos or games."
arch=(i686 x86_64)
url="http://code.google.com/p/protrekkr/"
license=('BSD')
if [ "$CARCH" = "x86_64" ]; then
    depends=('lib32-sdl' 'lib32-sdl_sound' 'lib32-sdl_mixer' 'lib32-sdl_ttf')
else
    depends=('sdl' 'sdl_sound' 'sdl_mixer' 'sdl_ttf')
fi
makedepends=()
provides=('protrekkr')
conflicts=('protrekkr')
install=
source=("http://protrekkr.googlecode.com/files/ptk_v$pkgver.zip" "protrekkr.desktop")
md5sums=('b8aeee60e7b820610f89dc07fa4ae902' 'ba3014ba47bed3518bbb369ebdc26bac')


build() {
	cd "$srcdir"

    # install the app
    mkdir -p "$pkgdir/opt/ptk"
    cp -rf * "$pkgdir/opt/ptk"

    # sym link to binary
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/ptk/ptk_linux" "$pkgdir/usr/bin/protrekkr"

    # desktop file
    mkdir -p "$pkgdir/usr/share/applications"
    install -Dm0644 "$srcdir/protrekkr.desktop" "$pkgdir/usr/share/applications"
}
