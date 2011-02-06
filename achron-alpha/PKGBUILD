# Contributor: Kevin Whitaker <eyecreate at gmail dot com>

pkgname=achron-alpha
pkgver=0.5.1.0
pkgrel=1
pkgdesc="Time travel RTS"
arch=('x86_64')
url='http://achrongame.com/site/'
license=('custom: "commercial"')
depends=('freetype2' 'openal' 'freealut' 'sdl')
source=('AchronLinux64bit-v'${pkgver}'.tar.bz2' 'achron-logo.png' 'achron.desktop' 'achron.launcher')
md5sums=('3e5b4d65302859ab780554c4630f79bf'
         'ee7e1747beb89d55ea3e8ede089f9b19'
         '47c6fb2fa98edf2bbe18b0252ca939c4'
         '16b8b7845359eef7f94e1156236390e0')

build() {
    cd $srcdir || return 1

# Create Destination Directory
    install -d $pkgdir/opt/Achron || return 1

# Extract Game 
    tar jxfv $srcdir/AchronLinux64bit-v${pkgver}.tar.bz2 || return 1


# Install the data
    cp -r $srcdir/Achron/* $pkgdir/opt/Achron || return 1


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

