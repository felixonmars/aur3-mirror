# Maintainer: Maxime Wack <maximewack at free dot fr>
# Contributor: Kevin Whitaker <eyecreate at gmail dot com>

pkgname=achron
pkgver=1.2.0.1
pkgrel=1
pkgdesc="Time travel RTS"
arch=('x86_64')
url='http://achrongame.com/site/'
license=('custom: "commercial"')
depends=('freetype2' 'openal' 'freealut' 'sdl' 'fontconfig' 'libogg' 'libvorbis')
source=('achron-logo.png' 'achron.desktop' 'achron.launcher')
md5sums=('ee7e1747beb89d55ea3e8ede089f9b19'
         '47c6fb2fa98edf2bbe18b0252ca939c4'
         '16b8b7845359eef7f94e1156236390e0')
_gamepkg="AchronLinux64bit-v${pkgver}.tar.bz2"

build() {
    cd $srcdir || return 1

    msg "You need a full copy of this game in order to install it"
    msg "Searching for ${_gamepkg} in dir: \"$startdir\""
    pkgpath=$startdir
    if [[ ! -f "$startdir/${_gamepkg}" ]]; then
        error "Game package not found, please type absolute path to ${_gamepkg} (/home/joe):"
        read pkgpath
        if [[ ! -f "${pkgpath}/${_gamepkg}" ]]; then
            error "Unable to find game package." && return 1
        fi
    fi
    msg "Found game package, installing..."

    ln -fs ${pkgpath}/${_gamepkg} . || return 1
    tar jxfv $srcdir/${_gamepkg} || return 1

    install -d $pkgdir/opt/Achron || return 1

    cp -R $srcdir/Achron/* $pkgdir/opt/Achron || return 1
}

package() {

    cd $srcdir


# Install Icon
    install -D -m 644 $srcdir/achron-logo.png \
        $pkgdir/usr/share/pixmaps/achron.png || return 1


# Install Launcher
    install -D -m 644 $srcdir/achron.desktop \
        $pkgdir/usr/share/applications/achron.desktop || return 1


# Install Game Launcher
    install -D -m 755 $srcdir/achron.launcher \
        $pkgdir/usr/bin/achron || return 1

}

