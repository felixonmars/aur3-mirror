# Maintainer: Drake Arconis <lightdrake@gmail.com>

pkgname=exodus-bin
pkgver=13.9.21.1
pkgrel=1
pkgdesc="This is an alternative viewer for SecondLife. SecondLife is a 3-D virtual world entirely built and owned by its residents."
url="http://www.exodusviewer.com/"
license=('LGPL')
if [ "$CARCH" = "i686" ]; then
    depends=('gnome-vfs' 'gtk2' 'libpng' 'openal' 'dbus-glib' 'libidn' 'sdl' 'mesa')
    optdepends=(
    'gstreamer0.10: For video support - may need good, bad and ugly plugins'
    'flashplugin: For flash supprt in Shared Media'
    'nvidia-utils: GL support for NVIDIA drivers' 
    'catalyst-utils: GL support for Catalyst Drivers')
elif [ "$CARCH" = "x86_64" ]; then
    depends=(
    'lib32-gtk2'
    'lib32-libpng'
    'lib32-openal'
    'lib32-dbus-glib'
    'lib32-libidn'
    'lib32-sdl'
    'lib32-mesa')
    optdepends=(
    'lib32-flashplugin: For flash supprt in Shared Media'
    'lib32-nvidia-utils: GL support for NVIDIA drivers' 
    'lib32-catalyst-utils: GL support for Catalyst Drivers'
    )
fi
arch=('i686' 'x86_64')
install="exodus.install"
source=("http://files.exodusviewer.com/linux/x86/exodusviewer-$pkgver.tar.lzma" 'exodus.install' 'exodus.desktop' 'exodus.launcher')
sha512sums=('238a9db4cb23182e8e35d965e2ad83d09e1202687838ffc76ed6675503c69d29f61804e3955199beaf791c74f6d9d48aa0fd1cb0a4caa0540c2d1bed6b8f56cd'
            'c49d9a8a74d0cec821cefb48564884b7f7a0de21f759845e7711c7a185ac0b1b07096d93c4f21b8bb3cc494d128e6e86f6219ae7715b371a33f645bad5d7c97e'
            'f547f0ba7181d478c2530df8088c716d13d612cbc9ca756bd807488d70c4dfd7c998c26e3b85ca898b7e40187e8959171003ce48f9874e3ed9b24ddcf4c7d575'
            '9e899744285f8529f5a9e7bc235e2064478d578d3f2ecb4dd1b6ee6d15fd1cf9bcf41fa60acf840f061aee017ce710281da30d5bafb9b732a4e13b6ba8cc0603')


package() {
    cd $srcdir;

    # Rename Data Directory
    mv exodusviewer-${pkgver}/ exodus-bin
    chmod 755 exodus-bin

    # Install Desktop File
    install -D -m644 $srcdir/exodus.desktop \
        $pkgdir/usr/share/applications/exodus.desktop

    # Install Icon File
    install -D -m644 $srcdir/exodus-bin/secondlife_icon.png \
        $pkgdir/usr/share/pixmaps/exodus_icon.png

    # Install Launcher
    install -D -m755 $srcdir/exodus.launcher \
        $pkgdir/usr/bin/exodus

    # Move Data to Destination Directory
    install -d $pkgdir/opt/
    mv exodus-bin/ $pkgdir/opt

    # Change Permissions of files to root:games
    chown -R root:games $pkgdir/opt/exodus-bin
    chmod -R g+r $pkgdir/opt/exodus-bin

    # Make Binary Group-Executable
    chmod g+x $pkgdir/opt/exodus-bin/secondlife
}
