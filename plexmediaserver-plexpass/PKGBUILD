# Contributor: Praekon <praekon@googlemail.com>
# Contributor: Arthur <arthur.darcet@m4x.org>
# Contributor: Jon Wiersma <archaur@jonw.org>
# Contributor: monty <linksoft [at] gmx [dot] de>
# Contributor: Mikhail Davidov <sirus@haxsys.net>
# Contributor: Tom Moore <t.moore01 [at] gmail [dot] com>
# Maintainer: Matt Henkel <guildencrantz@gmail.com>

pkgname=plexmediaserver-plexpass
pkgver=0.9.8.14.263
pkgrel=1
_subver=139ddbc
pkgdesc="Plex Media Server for Linux"
url='http://www.plexapp.com'
arch=('i686' 'x86_64')
license=('closed')
depends=('rsync' 'avahi')
conflicts=('plexmediaserver')
backup=('etc/conf.d/plexmediaserver')
install='plexmediaserver.install'

if [ "$CARCH" = "i686" ]; then
    _arch='i386'
    md5sums=('4dfa68ee841a4f61c11946662c654bd6')
elif [ "$CARCH" = "x86_64" ]; then
    _arch='amd64'
    md5sums=('e594e2551074d03d230476ecf62a69e6')
fi

if (( !INFAKEROOT )); then
    echo "This package requires that you are a PlexPass member and have access to the PlexPass forum and downloads (http://forums.plexapp.com/index.php/topic/64569-download-instructions/)"
    echo
    echo -n "Enter the user to download the package as: "
    read user
    echo -n "Enter the password for ${user}: "
    read -s password
    echo
fi

source=("http://${user}:${password}@plex.r.worldssl.net/plex-media-server/${pkgver}-${_subver}/plexmediaserver_${pkgver}-${_subver}_${_arch}.deb" "plexmediaserver.conf.d" "plexmediaserver.service" "start_pms")
md5sums+=('32cdd9f9de446f6646616a0077151726'
          'd850fe41dd35aba09a375ac8d81175e0'
          '34e9ddaab4ffc84ab9835abd16a383b3')
build() {
    ar -xv plexmediaserver_${pkgver}-${_subver}_${_arch}.deb || return 1
    tar -zxf data.tar.gz || return 1
}

package() {
    mkdir -p "${pkgdir}"/opt/plexmediaserver
    mkdir -p "${pkgdir}"/usr/lib/systemd/system

    cp -r usr/lib/plexmediaserver/* "${pkgdir}"/opt/plexmediaserver/

    install -Dm755 ../start_pms "${pkgdir}"/opt/plexmediaserver/
    install -Dm644 ../plexmediaserver.conf.d "${pkgdir}"/etc/conf.d/plexmediaserver
    install -Dm644 ../plexmediaserver.service "${pkgdir}"/usr/lib/systemd/system/plexmediaserver.service
}

# vim: set ts=4 sts=4 sw=4 ai et:
