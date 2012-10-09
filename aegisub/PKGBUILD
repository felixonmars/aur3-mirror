# Maintainer: kozec <kozec at kozec dot com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgname=aegisub
pkgver=3.0.1
pkgrel=2
pkgdesc="A general-purpose subtitle editor with ASS/SSA support"
arch=('i686' 'x86_64')
url="http://www.aegisub.org"
license=('GPL' 'BSD')
conflicts=('aegisub-bin' 'aegisub-svn' 'aegisub-stable-svn')
source=("http://ftp.aegisub.org/pub/releases/$pkgname-$pkgver.tar.xz")
install=aegisub.install

# Dependencies converted from Aegisub wiki
# http://devel.aegisub.org/wiki/Build/Deps
# with all redundant dependencies removed
depends=('fontconfig>=2.4.2' 'lua>=5.1' 'hunspell'
    'wxgtk2.9' 'libass>=0.10' 'ffmpegsource>=2.16'
    'fftw' 'desktop-file-utils' 'hicolor-icon-theme'
    )

build() {
        cd "$srcdir/$pkgname-$pkgver/$pkgname/"
        LDFLAGS="$LDFLAGS -lz" ./configure --prefix=/usr --with-player-audio=alsa \
            --without-{portaudio,openal,oss} --with-wx-config=/usr/bin/wx-config-2.9
        make
}

package() {
        cd "$srcdir/$pkgname-$pkgver/$pkgname/"
        make DESTDIR="$pkgdir" install
        ln -s $pkgname-3.0 "$pkgdir/usr/bin/$pkgname"
}

md5sums=('3561822b609999d38e8d978ca8eabecc')
