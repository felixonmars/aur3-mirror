# Maintainer: Zauber Paracelsus <zauber@gridmail.org>
# PKGBUILD was modified from firestorm-bin package created by chungy
# SSE3 optimized build for i686.  Builds for x86_64 already use SSE3 optimization
pkgname=inworldz-sse3-bin
pkgver=2.2.11.34957
pkgrel=3
pkgdesc="The official viewer for InWorldz, an online virtual world, with SSE3 optimization"
url="https://inworldz.com/"
license=('GPL')
depends=('openal' 'gtk2' 'libpng' 'dbus-glib' 'libidn' 'sdl' 'mesa')
optdepends=('gstreamer0.10: For video support - may need good, bad and ugly plugins')
arch=('i686' 'x86_64')
[ "$CARCH" = "x86_64" ] && depends=('lib32-gtk2' 'lib32-libpng' 'lib32-openal' 'lib32-dbus-glib' 'lib32-libidn' 'lib32-sdl' 'lib32-mesa')
[ "$CARCH" = "x86_64" ] && optdepends=('lib32-nvidia-utils: GL support for NVIDIA drivers')
provides=("inworldz-bin")

install=inworldz.install
source=("http://inworldz.com/Imprudence/builds/radiant/InWorldz_Beta_i686_${pkgver}-SSE3.tar.bz2"
 'inworldz.install' 'inworldz.desktop' 'inworldz.launcher' 'settings.patch')

sha256sums=('136110e385c3a1d80de586030d3c81ec4e647cf35a46386b6f3b506629e37512'
            'c3ed708c4a78ab7c4210914469958d8815b7c325577563d3ac87d4c91676fdbc'
            'f2155704ba49c961a64d693523306adf0e2f157fadb6155fac57c8d7d83c6428'
            '76bd0b992ee1110f93fafd115dcb6c3d447bc0855a34b2daf742c0d975bafca4'
            '5bb5c94dd212c4e9676f49111edc46fb45539f4cf06186c37cd002a245b310f4')


package() {
	patch "${srcdir}/InWorldz_Beta_i686_${pkgver}-SSE3/app_settings/settings.xml" < settings.patch
    cd "${srcdir}"

    # Rename Data Directory
    mv InWorldz_Beta_i686_${pkgver}-SSE/ inworldz

    # Install Desktop File
    install -D -m644 "${srcdir}"/inworldz.desktop \
        "${pkgdir}"/usr/share/applications/inworldz.desktop

    # Install Icon File
    install -D -m644 "${srcdir}"/inworldz/inworldz_icon.png \
        "${pkgdir}"/usr/share/pixmaps/inworldz_icon.png

    # Install Launcher
    install -D -m755 "${srcdir}"/inworldz.launcher \
        "${pkgdir}"/usr/bin/inworldz

    # Move Data to Destination Directory
    install -d "${pkgdir}"/opt/
    mv inworldz/ "${pkgdir}"/opt/

    # Change Permissions of files to root:games
    chown -R root:games "${pkgdir}"/opt/inworldz
    chmod -R g+r "${pkgdir}"/opt/inworldz

    # Make Binary Group-Executable
    chmod g+x "${pkgdir}"/opt/inworldz/inworldz
}
