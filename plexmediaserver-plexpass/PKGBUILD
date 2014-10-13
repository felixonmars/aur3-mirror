# Contributor: Praekon <praekon@googlemail.com>
# Contributor: Arthur <arthur.darcet@m4x.org>
# Contributor: Jon Wiersma <archaur@jonw.org>
# Contributor: monty <linksoft [at] gmx [dot] de>
# Contributor: Mikhail Davidov <sirus@haxsys.net>
# Contributor: Tom Moore <t.moore01 [at] gmail [dot] com>
# Contributor: Matt Henkel <guildencrantz@gmail.com>
# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=plexmediaserver-plexpass
pkgver=0.9.11.0
pkgrel=1
_subver=672-bf09ab7
pkgdesc="PlexPass Release of Plex Media Server for Linux"
url='https://plex.tv/'
arch=('i686' 'x86_64')
license=('closed')
depends=('rsync' 'avahi')
conflicts=('plexmediaserver')
backup=('etc/conf.d/plexmediaserver')
install='plexmediaserver.install'

source=("plexmediaserver.conf.d"
        "plexmediaserver.service"
        "start_pms")
md5sums=('32cdd9f9de446f6646616a0077151726'
         'd850fe41dd35aba09a375ac8d81175e0'
		 '34e9ddaab4ffc84ab9835abd16a383b3')

if [ "$CARCH" = "i686" ]; then
    source+=("https://downloads.plex.tv/plex-media-server/${pkgver}.${_subver}/plexmediaserver_${pkgver}.${_subver}_i386.deb")
    md5sums+=('fc3ca7876b40ffc51c6b9e0a017bb7fe')
elif [ "$CARCH" = "x86_64" ]; then
    source+=("https://downloads.plex.tv/plex-media-server/${pkgver}.${_subver}/plexmediaserver_${pkgver}.${_subver}_amd64.deb")
    md5sums+=('31ab5b9bce996a5b244f544a7ed26988')
fi

prepare() {
    tar -zxf data.tar.gz
}

package() {
    mkdir -p "${pkgdir}/opt/plexmediaserver"
    mkdir -p "${pkgdir}/usr/lib/systemd/system"

    cp -r usr/lib/plexmediaserver/* "${pkgdir}/opt/plexmediaserver/"

    install -Dm755 "${srcdir}/start_pms" "${pkgdir}/opt/plexmediaserver/"
    install -Dm644 "${srcdir}/plexmediaserver.conf.d" "${pkgdir}/etc/conf.d/plexmediaserver"
    install -Dm644 "${srcdir}/plexmediaserver.service" "${pkgdir}/usr/lib/systemd/system/plexmediaserver.service"
}

# vim: set ts=4 sts=4 sw=4 ai et:
