# Maintainer: kozec <kozec at kozec dot com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgname=aegisub
pkgver=3.0.2
pkgrel=4
pkgdesc="A general-purpose subtitle editor with ASS/SSA support"
arch=('i686' 'x86_64')
url="http://www.aegisub.org"
license=('GPL' 'BSD')
conflicts=('aegisub-bin' 'aegisub-svn' 'aegisub-stable-svn')
source=("http://ftp.aegisub.org/pub/releases/$pkgname-$pkgver.tar.xz"
	"crash-on-deatach-workaround.patch"
	"use-lua51.patch"
	)
install=aegisub.install

# Dependencies converted from Aegisub wiki
# http://devel.aegisub.org/wiki/Build/Deps
# with all redundant dependencies removed
depends=('fontconfig>=2.4.2' 'lua51' 'hunspell'
    'wxgtk2.9' 'libass>=0.10' 'ffmpegsource>=2.16'
    'fftw' 'desktop-file-utils' 'hicolor-icon-theme'
    )

makedepends=('mesa')

build() {
        cd "$srcdir/$pkgname/$pkgname/"
        patch -Np0 -i "$srcdir"/crash-on-deatach-workaround.patch || return 1
        patch -Np0 -i "$srcdir"/use-lua51.patch
        LDFLAGS="$LDFLAGS -lz" ./autogen.sh --prefix=/usr --with-player-audio=alsa \
            --without-{portaudio,openal,oss} --with-wx-config=/usr/bin/wx-config-2.9
        make
}

package() {
        cd "$srcdir/$pkgname/$pkgname/"
        make DESTDIR="$pkgdir" install
        ln -s $pkgname-3.0 "$pkgdir/usr/bin/$pkgname"
}

md5sums=('d3817d493d0f2f1ee9c5a8e0a58d591e'
         '8681f9ca3ac21221c4fec2f940eb2bb6'
         '079b20341d8e10530dd415172bac8fcc')
