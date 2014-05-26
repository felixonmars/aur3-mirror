# Maintainer: Zauber Paracelsus <zauber@gridmail.org>
# PKGBUILD was modified from firestorm-bin package created by chungy
pkgname=inworldz-bin
pkgver=2.2.11.34957
pkgrel=3
pkgdesc="The official viewer for InWorldz, an online virtual world."
url="https://inworldz.com/"
license=('GPL')
depends=('openal' 'gtk2' 'libpng' 'dbus-glib' 'libidn' 'sdl' 'mesa')
optdepends=('gstreamer0.10: For video support - may need good, bad and ugly plugins')
arch=('i686' 'x86_64')
provides=("inworldz-bin")
install=inworldz.install
source=("http://inworldz.com/Imprudence/builds/radiant/InWorldz_Beta_${CARCH}_${pkgver}.tar.bz2"
 'inworldz.install' 'inworldz.desktop' 'inworldz.launcher' 'settings.patch')

[ "$CARCH" = "i686" ] && sha256sums=('29a613d42f5702a3fe3b16ac06fd2c04a7fb3c53e176ea2f5d8c562a429caf9e'
            'b7b53ff73f3b33bc362e9508926f34b83facc49ca6be982f1267653ad5573bc1'
            'f2155704ba49c961a64d693523306adf0e2f157fadb6155fac57c8d7d83c6428'
            '76bd0b992ee1110f93fafd115dcb6c3d447bc0855a34b2daf742c0d975bafca4'
            '5bb5c94dd212c4e9676f49111edc46fb45539f4cf06186c37cd002a245b310f4')
[ "$CARCH" = "x86_64" ] && sha256sums=('fd71d2fb43cfd3930dbcf9769f5cf6a6a62fd48c128d4689a7cbb20ed8470629'
            'b7b53ff73f3b33bc362e9508926f34b83facc49ca6be982f1267653ad5573bc1'
            'f2155704ba49c961a64d693523306adf0e2f157fadb6155fac57c8d7d83c6428'
            '76bd0b992ee1110f93fafd115dcb6c3d447bc0855a34b2daf742c0d975bafca4'
            '5bb5c94dd212c4e9676f49111edc46fb45539f4cf06186c37cd002a245b310f4')


package() {
	patch "${srcdir}/InWorldz_Beta_${CARCH}_${pkgver}/app_settings/settings.xml" < settings.patch
    cd "${srcdir}"

    # Rename Data Directory
    mv InWorldz_Beta_${CARCH}_${pkgver}/ inworldz

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
