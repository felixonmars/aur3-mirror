# Maintainer: Ethan Best <underscr97@gmail.com>
# Previous Maintainer: Tayhe <admin@tayhe.com>
# contributors: Tomas A. Schertel <tomasΘarchlinux-br·org>


pkgname="livestation"
pkgver="3.2.0"
pkgrel=1
pkgdesc="Watch the world's leading TV channels in the highest quality plus your favourite web channels, all in one free player"
url="http://www.livestation.com/"
license=('Custom')
arch=('i686 x86_64')
install=$pkgname.install

source=("http://updates.livestation.com/releases/Livestation-${pkgver}-i386.run"
        'livestation.png'
        'livestation.desktop'
        'livestation.install')

if [ $CARCH = "x86_64" ] ; then
	depends=('lib32-alsa-lib' 'lib32-e2fsprogs' 'lib32-expat' 'lib32-fontconfig' 'lib32-freetype2' \
	'lib32-gcc-libs' 'lib32-glib2' 'lib32-glibc' 'lib32-libice' 'lib32-libpng' 'lib32-libsm' \
	'lib32-libstdc++5' 'lib32-libx11' 'lib32-libxau' 'lib32-libxcb' 'lib32-libxdmcp' 'lib32-libxext' \
	'lib32-libxi' 'lib32-libxrandr' 'lib32-libxrender' 'lib32-mesa' 'lib32-pcre' 'lib32-zlib')
else
	depends=()
fi

md5sums=('c723438f46d5fa1bf1d2e77fc6ab38b8'
         '5e7402591995dbdce534f77b1595ccf1'
         '0ef021ef135773df9da6f48f8932951d'
         '6c7ad684e8749b503241cef3afc62c46')

package_livestation() {
    # Check package
    sh "Livestation-${pkgver}-i386.run" --check || return 1

    # Unpack
    echo yes | sh "Livestation-${pkgver}-i386.run" --target "$srcdir" \
        --nox11 --noexec &>/dev/null || return 1

    # Copy desktop icons and desktop links
    install -d $pkgdir/opt/livestation || return 1
    install -m 755 $srcdir/i386/Livestation $pkgdir/opt/livestation/ || return 1
    install -m 755 $srcdir/i386/Livestation.bin $pkgdir/opt/livestation/ || return 1
    install -m 755 $srcdir/i386/README $pkgdir/opt/livestation/ || return 1
    install -m 755 $srcdir/i386/EULA $pkgdir/opt/livestation/ || return 1
    install -m 755 $srcdir/i386/COPYING $pkgdir/opt/livestation/ || return 1
    install -m 755 $srcdir/i386/COPYING.LESSER $pkgdir/opt/livestation/ || return 1
    install -m 755 $srcdir/i386/qt.conf $pkgdir/opt/livestation/ || return 1

    install -d $pkgdir/usr/share/pixmaps || return 1
    install -m 644 livestation.png $pkgdir/usr/share/pixmaps/ || return 1
    install -d $pkgdir/usr/share/applications/ || return 1
    install -m 644 livestation.desktop $pkgdir/usr/share/applications || return 1
    
    # Install image formats plugins
    install -d $pkgdir/opt/livestation/plugins/imageformats/ || return 1
    install -m 755 $srcdir/i386/plugins/imageformats/libqgif.so $pkgdir/opt/livestation/plugins/imageformats/ || return 1
    install -m 755 $srcdir/i386/plugins/imageformats/libqico.so $pkgdir/opt/livestation/plugins/imageformats/ || return 1
    install -m 755 $srcdir/i386/plugins/imageformats/libqjpeg.so $pkgdir/opt/livestation/plugins/imageformats/ || return 1
    install -m 755 $srcdir/i386/plugins/imageformats/libqmng.so $pkgdir/opt/livestation/plugins/imageformats/ || return 1
    install -m 755 $srcdir/i386/plugins/imageformats/libqsvg.so $pkgdir/opt/livestation/plugins/imageformats/ || return 1
    install -m 755 $srcdir/i386/plugins/imageformats/libqtiff.so $pkgdir/opt/livestation/plugins/imageformats/ || return 1

    # Install QT libraries and replace built-in ones
    install -d $pkgdir/opt/livestation/lib/ || return 1
    install -m 755 $srcdir/i386/lib/libavcodec.so.52 $pkgdir/opt/livestation/lib/ || return 1
    install -m 755 $srcdir/i386/lib/liblive555.so $pkgdir/opt/livestation/lib/ || return 1
    install -m 755 $srcdir/i386/lib/libQtNetwork.so.4 $pkgdir/opt/livestation/lib/ || return 1
    install -m 755 $srcdir/i386/lib/libssl.so.0.9.8 $pkgdir/opt/livestation/lib/ || return 1
    install -m 755 $srcdir/i386/lib/libavformat.so.52 $pkgdir/opt/livestation/lib/ || return 1
    install -m 755 $srcdir/i386/lib/libopenal.so.0 $pkgdir/opt/livestation/lib/ || return 1
    install -m 755 $srcdir/i386/lib/libQtOpenGL.so.4 $pkgdir/opt/livestation/lib/ || return 1
    install -m 755 $srcdir/i386/lib/libswscale.so.0 $pkgdir/opt/livestation/lib/ || return 1
    install -m 755 $srcdir/i386/lib/libavutil.so.50 $pkgdir/opt/livestation/lib/ || return 1
    install -m 755 $srcdir/i386/lib/libQtCore.so.4 $pkgdir/opt/livestation/lib/ || return 1
    install -m 755 $srcdir/i386/lib/libQtWebKit.so.4 $pkgdir/opt/livestation/lib/ || return 1
    install -m 755 $srcdir/i386/lib/libXtst.so.6 $pkgdir/opt/livestation/lib/ || return 1
    install -m 755 $srcdir/i386/lib/libcrypto.so.0.9.8 $pkgdir/opt/livestation/lib/ || return 1
    install -m 755 $srcdir/i386/lib/libQtGui.so.4 $pkgdir/opt/livestation/lib/ || return 1
    install -m 755 $srcdir/i386/lib/libQtXml.so.4 $pkgdir/opt/livestation/lib/ || return 1

    # Creating the launcher
    install -d $pkgdir/usr/bin/ || return 1
    ln -s "/opt/livestation/Livestation" "$pkgdir/usr/bin/Livestation" || return 1

}
