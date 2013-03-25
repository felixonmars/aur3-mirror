# Contributor: KillaB <xGenoBlast@gmail.com>
# Contributor: wizzomafizzo <wizzomafizzo@gmail.com>
# Contributor: Nick <nick@screamingfist.org>
# Maintainer: Jupotter <jupotter.g@gmail.com>

pkgname=doomrl-lq
pkgver=0.9.9.7
pkgrel=1
pkgdesc="A roguelike game based on the FPS Doom. Low Quality version"
arch=("i686" "x86_64")
url="http://doom.chaosforge.org/"
license=("custom")
depends=("sdl_mixer"
        "zlib"
        "lua"
        "timidity-eawpatches"
        "sdl_image")
conflicts=("doomrl doomrl-ogg")
provides=("doomrl=0.9.9.7")
source=("http://doom.chaosforge.org/file_download/38/doomrl-linux-i386-0997.tar.gz"
        "doomrl" "LICENSE")
md5sums=('12a2d4f9d715bc1bb92629a87c2040de'
         '825cac701303cd5c61ec209e461219de'
         'eaa0c779f98be421bf34cd0c5800642a')

[ "$CARCH" == "x86_64" ] && \
        source=("http://doom.chaosforge.org/file_download/37/doomrl-linux-x64-0997.tar.gz"
                "doomrl" "LICENSE") \
        && md5sums=('17d6e0b1d2d1e5c50a76dcea17650df2'
                    '825cac701303cd5c61ec209e461219de'
                    'eaa0c779f98be421bf34cd0c5800642a')

build() {
    if [ "$CARCH" == "x86_64" ] ; then
        cd "$srcdir/doomrl-linux-x64-${pkgver//./}-lq"
    else
        cd "$srcdir/doomrl-linux-i386-${pkgver//./}-lq"
    fi

    # Copy program and required files
    mkdir -p "$pkgdir/usr/share/doomrl"
    cp -a * "$pkgdir/usr/share/doomrl"

    # Copy script used to run program
    install -D -m755 "$srcdir/doomrl" "$pkgdir/usr/bin/doomrl"

    # Comy the license file
    install -D -m644 "$srcdir/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # This is needed to save games and scores
    chmod 4755 "$pkgdir/usr/share/doomrl/doomrl"
}

