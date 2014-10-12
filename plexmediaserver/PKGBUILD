# Contributor: Praekon <praekon@googlemail.com>
# Contributor: Arthur <arthur.darcet@m4x.org>
# Contributor: Jon Wiersma <archaur@jonw.org>
# Contributor: monty <linksoft [at] gmx [dot] de>
# Contributor: Tom Moore <t.moore01 [at] gmail [dot] com>
# Maintainer: Rob Sletten <rsletten [at] gmail [dot] com>

pkgname=plexmediaserver
pkgver=0.9.9.14.531
pkgrel=1
_subver=7eef8c6
pkgdesc="Plex Media Server for Linux"
url='https://plex.tv/'
arch=('i686' 'x86_64')
license=('closed')
depends=('ffmpeg' 'ffmpeg-compat' 'libidn' 'libxslt' 'curl' 'python2')
conflicts=('plexmediaserver-plexpass')
backup=('etc/conf.d/plexmediaserver')
install='plexmediaserver.install'

if [ "$CARCH" = "i686" ]; then
       _arch='i386'
       md5sums=('1f580f732e3e76134afdb4cd98e64dea')
elif [ "$CARCH" = "x86_64" ]; then
       _arch='amd64'
       md5sums=('3bc1d1c2378332e054ff493d584b5e8b')
fi

source=("http://downloads.plex.tv/plex-media-server/${pkgver}-${_subver}/${pkgname}_${pkgver}-${_subver}_${_arch}.deb" "${pkgname}.conf.d" "${pkgname}.service" "start_pms")
md5sums+=('32cdd9f9de446f6646616a0077151726'
	  'd64ea728767856cf08d0261e11b8a9e1'
	  '69efb2441c7971a9e546d76b51cd12cc')

build() {
       ar -xv plexmediaserver_${pkgver}-${_subver}_${_arch}.deb || return 1
       tar -zxf data.tar.gz || return 1
}

package() {
       mkdir -p "${pkgdir}"/opt/plexmediaserver
       mkdir -p "${pkgdir}"/usr/lib/systemd/system

       cp -r usr/lib/plexmediaserver/* "${pkgdir}"/opt/plexmediaserver/

       install -Dm755 ${srcdir}/start_pms "${pkgdir}"/opt/plexmediaserver/
       install -Dm644 ${srcdir}/plexmediaserver.conf.d "${pkgdir}"/etc/conf.d/plexmediaserver
       install -Dm644 ${srcdir}/plexmediaserver.service "${pkgdir}"/usr/lib/systemd/system/plexmediaserver.service
}
