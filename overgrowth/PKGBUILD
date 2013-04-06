# Maintainer: Gerardo Marset <gammer1994@gmail.com>

pkgname=overgrowth
pkgver=a198
pkgrel=3
pkgdesc="A 3D action-adventure game featuring anthropomorphic animals."
arch=('i686' 'x86_64')
url="http://www.wolfire.com/overgrowth"
license=('unknown')
depends=(alsa-lib freealut freeimage gconf gtk2 libjpeg6 libpng12 libtheora
         libvorbis libxss mesa nss sdl)
source=(overgrowth-$pkgver-linux.sh)
md5sums=('f2576c90d67ba221b3f24a172ad030a3')
noextract=()
options=(!strip)

_installdir="/usr/local/games/$pkgname"
[ "$CARCH" == "x86_64" ] && _suffix=_64

PKGEXT=.pkg.tar

build() {
    msg "Extracting installer..."
    sh overgrowth-$pkgver-linux.sh --tar -xvf

    msg "Extracting subarchive..."
    tar -xzf subarch

    msg "Extracting common files..."
    mkdir -p $pkgdir/$_installdir
    cd $pkgdir/$_installdir
    tar -xzf $srcdir/instarchive_all

    msg "Extracting arch-specific files..."
    tar -xzf $srcdir/instarchive_linux_x86$_suffix

    #Patch removed as it drastically reduces texture quality, if desired apply manually. Or wait for wolfire to fix it themselves.
    #msg "Applying GLSL patch..."
    cd Data/GLSL
    #tar -xzf $srcdir/GLSLversion120_fix.tar.gz
    chmod -x *

    msg "Extracting awesomium..."
    cd ../..
    tar -xzf $srcdir/deps/Awesomium/Awesomium_files_all
    tar -xzf $srcdir/deps/Awesomium/Awesomium_files_linux_x86$_suffix
    ln -s ../chrome.pak lib${_suffix/_/}
    ln -s ../locales lib${_suffix/_/}

    msg "Creating launcher..."
    mkdir -p $pkgdir/usr/bin
    f=$pkgdir/usr/bin/$pkgname
    echo "#!/bin/sh" > $f
    echo "" >> $f
    echo "cd $_installdir" >> $f
    echo "./Overgrowth.bin.x86$_suffix $@" >> $f
    chmod +x $f

    mkdir -p $pkgdir/usr/share/{pixmaps,applications}
    cp overgrowth.png $pkgdir/usr/share/pixmaps/$pkgname.png
    f=$pkgdir/usr/share/applications/$pkgname.desktop
    echo "[Desktop Entry]" > $f
    echo "Name=Overgrowth" >> $f
    echo "Comment=$pkgdesc" >> $f
    echo "Exec=$pkgname" >> $f
    echo "Icon=$pkgname" >> $f
    echo "Type=Application" >> $f
    echo "Categories=Game;ActionGame;" >> $f
    echo "Encoding=UTF-8" >> $f
}
