# Maintainer: Perry3D <perry3d@gmail.com>
# Contributor: Eothred <yngve.levinsen@gmail.com>

pkgname=spotify-beta
pkgver=1.0.1.1062
_additionalVersion=1.0.0.1146.gf9b5fe37
pkgrel=2
pkgdesc='A proprietary peer-to-peer music streaming service'
arch=('x86_64')
license=('custom:"Copyright 2006-2013 Spotify Ltd"')
install=spotify.install
url="http://www.spotify.com"
options=('!strip')
conflicts=('spotify')


source=("spotify.protocol")
md5sums=('ef25ddc5b6bf8fe1a0d64cbd79e1f7b4')

source_x86_64=("http://download.spotify.com/beta/spotify-client_${pkgver}_amd64.deb"
"http://download.spotify.com/beta/spotify-app-${_additionalVersion}.tar.bz2")
md5sums_x86_64=('b3da299fd051801f30f34441fd47de79'
                '6966292146abc543cfabd1da9b7eb719')


depends=("alsa-lib>=1.0.14" "glibc>=2.6" "libxss" "qtwebkit" "gconf" "nspr>=4.0"
"nspr<5.0" "nss" "dbus" "systemd" "libgcrypt15" "gtk2")
optdepends=('desktop-file-utils: Adds URI support to compatible desktop environments'
'ffmpeg-compat: Adds support for playback of local files')

package() {
    cd "${srcdir}"

    #extract deb
    ar x "spotify-client_${pkgver}_amd64.deb" > /dev/null
    tar -xzf data.tar.gz -C "${pkgdir}"

    #fix permissions
    cd ${pkgdir}
    chmod 755 * -R
    
    #install icons
    mkdir -p "${pkgdir}/usr/share/spotify/icons"
    install -Dm644 ${srcdir}/spotify-app-${_additionalVersion}/icons/* "${pkgdir}/usr/share/spotify/icons"

    #install desktop file
    install -Dm644 "${srcdir}/spotify-app-${_additionalVersion}/spotify.desktop" "${pkgdir}/usr/share/spotify/"

    #install register and unregister scripts
    install -Dm755 "${srcdir}/spotify-app-${_additionalVersion}/register.sh" "${pkgdir}/usr/share/spotify/"
    install -Dm755 "${srcdir}/spotify-app-${_additionalVersion}/unregister.sh" "${pkgdir}/usr/share/spotify/"

    # Copy license
    # Did not found any license in beta client
    # install -Dm644 "${pkgdir}/usr/share/doc/${pkgname}-client/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"

    # Copy protocol file if KDE is installed
    if [ -f /usr/bin/startkde ]; then
        echo "Installing with KDE support"
        install -Dm644 "${srcdir}/spotify.protocol" "${pkgdir}/usr/share/kde4/services/spotify.protocol"
    fi
}
