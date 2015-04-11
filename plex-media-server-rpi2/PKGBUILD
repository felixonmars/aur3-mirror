# Maintainer: James Barbour <james at jebarb dot com>
pkgname=plex-media-server-rpi2
pkgver=0.9.11.16.958
_pkgsum=80f1748
pkgrel=1
pkgdesc='Plex Media Server for Raspberry Pi 2'
url='https://plex.tv'
arch=('armv7h')
license=('custom')
depends=('systemd')
conflicts=('plex-media-server' 'plex-media-server-plexpass')
backup=('etc/conf.d/plexmediaserver')
install='plex-media-server.install'
source=('plexmediaserver.conf.d'
        'plexmediaserver.service'
        'terms.txt'
        "https://downloads.plex.tv/plex-media-server/${pkgver}-${_pkgsum}/PlexMediaServer-${pkgver}-${_pkgsum}-arm7.spk")
md5sums=('ce68337bf5cdfb8b2183cc1180382d11'
         '34268b981e3b8c833a0e2270429232a6'
         'bd703bc750b989a27edd590eb8c8e9d7'
         '3e4013bc905d8c46de7155d3ae0bd865')
sha256sums=('7ab1ee8da9012d257b7f473fb79d76b201ca592cbe3722f977a43b58bfad180e'
            '9da45cc3951ae03086ec663e6273c2de0183495fd15dc34ddd9aa100346d4d3a'
            '7bb97271eb2dc5d1dcb95f9763f505970d234df17f1b8d79b467b9020257915a'
            'c28d150ec3fbe1a5158f496dec809bdcad15cc67254059388a0a16ae78dbdc31')

package() {
  install -dm 755 "${pkgdir}"/{opt,etc/conf.d,usr/lib/systemd/system}
  install -dm 755 plexmediaserver
  tar -xf package.tgz -C plexmediaserver/
  cp -dr --no-preserve='ownership' plexmediaserver "${pkgdir}"/opt/
  install -m 644 plexmediaserver.service "${pkgdir}"/usr/lib/systemd/system/
  install -m 644 plexmediaserver.conf.d "${pkgdir}"/etc/conf.d/plexmediaserver

  install -dm 755 "${pkgdir}"/var/lib/plex

  install -dm 755 "${pkgdir}"/usr/share/licenses/plex-media-server
  install -m 644 terms.txt "${pkgdir}"/usr/share/licenses/plex-media-server/

}

# vim:set ts=2 sw=2 et:
