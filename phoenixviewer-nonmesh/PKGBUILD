# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
# Old Maintainer: MacCyber <jonas at electrosheep dot org>
pkgname=phoenixviewer-nonmesh
pkgver=1.5.2.1185
pkgrel=1
pkgdesc="Second Life is a 3-D virtual world entirely built and owned by its residents. Phoenix is alternative viewer for secondlife (native 32bit)"
url="http://www.phoenixviewer.com"
license=('GPL')
depends=('openal' 'gnome-vfs' 'gtk2' 'libpng' 'dbus-glib' 'libidn' 'sdl' 'mesa')
optdepends=('gstreamer0.10: For video support - may need good, bad and ugly plugins')
[ "$CARCH" = "x86_64" ] && depends=('lib32-gtk2' 'lib32-libpng' 'lib32-openal' 'lib32-dbus-glib' 'lib32-gnome-vfs' 'lib32-libidn' 'lib32-sdl' 'lib32-mesa')
[ "$CARCH" = "x86_64" ] && optdepends=('lib32-nvidia-utils: GL support for NVIDIA drivers')
arch=('i686' 'x86_64')
conflicts=('phoenixviewer')
install=phoenixviewer.install
source=("http://downloads.phoenixviewer.com/Linux/PhoenixViewer-i686-${pkgver}.tar.bz2" 'phoenixviewer.install' 'phoenixviewer.desktop' 'phoenixviewer.launcher')
sha256sums=('f4894aeb3528fbed69a28774ee630e8f4d11b3daba5b49f9e31c74d8443e16b4'
            '49474f47582337455b016b99e64d53c0f66733646038b8b3090dc08bd5d0bf47'
            'a482e96e1293fd0af7aec88115f3c7b0d67e6d308d450a3b819d43cee8c7f465'
            'b856c4577c954151ef9296d2b24a75afb6d2fd45f8d66ae996adcea5c47b50ad')

build() {
    cd $srcdir;

    # Rename Data Directory
    mv PhoenixViewer-i686-${pkgver}/ phoenixviewer

    # Install Desktop File
    install -D -m644 $srcdir/phoenixviewer.desktop \
        $pkgdir/usr/share/applications/phoenixviewer.desktop

    # Install Icon File
    install -D -m644 $srcdir/phoenixviewer/phoenix_icon.png \
        $pkgdir/usr/share/pixmaps/phoenix_icon.png

    # Install Launcher
    install -D -m755 $srcdir/phoenixviewer.launcher \
        $pkgdir/usr/bin/phoenixviewer

    # Move Data to Destination Directory
    install -d $pkgdir/opt/
    mv phoenixviewer/ $pkgdir/opt/

    # Change Permissions of files to root:games
    chown -R root:games $pkgdir/opt/phoenixviewer
    chmod -R g+r $pkgdir/opt/phoenixviewer

    # Make Binary Group-Executable
    chmod g+x $pkgdir/opt/phoenixviewer/snowglobe
}
