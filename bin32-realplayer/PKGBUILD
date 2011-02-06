
pkgname=bin32-realplayer
pkgver=11.0.2.2315
pkgrel=1
pkgdesc="Real Media Player produced by RealNetworks"
arch=('x86_64')
url="http://www.real.com/linux/"
license=('custom')
depends=('bash' 'lib32-alsa-lib' 'lib32-gtk2' 'lib32-librsvg' 'lib32-libxdamage' 'lib32-libxv' 'lib32-pango')
makedepends=('rpmextract')
source=(http://forms.real.com/real/player/download.html?f=unix/RealPlayer11GOLD.rpm realplayer.bash)
md5sums=('768cde61d80f3d60110d8bc92fcb156d'
         '6ecc876d3cfa398f0e765d4856268244')
sha256sums=('9b0acfe643b50fac8f6ddbbe10875c7498e735040c918b21dd824b9f41388f2e'
            '1351339f7c6940a85a76a58cb7e47a27ecb11852bfea1ce00bbb2cd6b5d8ee72')

build() {
  cd "${srcdir}"
  rpmextract.sh RealPlayer11GOLD.rpm
# copying files
  install -d ${pkgdir}/opt/realplayer
  install -d ${pkgdir}/usr/{bin,share}
  install -m 0755 realplayer.bash ${pkgdir}/usr/bin/realplay

  cd opt/real/RealPlayer
  cp -R codecs common plugins share ${pkgdir}/opt/realplayer
  find ${pkgdir}/opt/realplayer/share -type f -exec chmod 644 {} \;
  find ${pkgdir}/opt/realplayer -type d -exec chmod 755 {} \;
  install -D -m 0755 realplay realplay.bin ${pkgdir}/opt/realplayer

# installing mozilla plugins
  install -D -m 0755 mozilla/nphelix.so ${pkgdir}/usr/lib/mozilla/plugins/nphelix.so
  install -m 0755 mozilla/nphelix.xpt ${pkgdir}/usr/lib/mozilla/plugins/

# installing icons
  for res in 16 192 32 48; do
    install -d ${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps
    cp ${pkgdir}/opt/realplayer/share/icons/realplay_${res}x${res}.png \
       ${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/realplay.png
  done
  install -d ${pkgdir}/usr/share/icons/hicolor/{48x48,192x192}/mimetypes
  for mime in generic ogg ram rpm smil; do
    ln -s /opt/realplayer/share/icons/mime-application-${mime}_48x48.png \
        ${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/realplay-application-${mime}.png
    ln -s /opt/realplayer/share/icons/mime-application-${mime}_192x192.png \
        ${pkgdir}/usr/share/icons/hicolor/192x192/mimetypes/realplay-application-${mime}.png
  done
  for mime in aiff au generic ogg wav; do
    ln -s /opt/realplayer/share/icons/mime-audio-${mime}_48x48.png \
        ${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/realplay-audio-${mime}.png
    ln -s /opt/realplayer/share/icons/mime-audio-${mime}_192x192.png \
        ${pkgdir}/usr/share/icons/hicolor/192x192/mimetypes/realplay-audio-${mime}.png
  done
  ln -s /opt/realplayer/share/icons/mime-text-realtext_48x48.png \
        ${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/realplay-text-realtext.png
  ln -s /opt/realplayer/share/icons/mime-text-realtext_192x192.png \
        ${pkgdir}/usr/share/icons/hicolor/192x192/mimetypes/realplay-text-realtext.png
  for mime in generic ogg; do
    ln -s /opt/realplayer/share/icons/mime-video-${mime}_48x48.png \
        ${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/realplay-video-${mime}.png
    ln -s /opt/realplayer/share/icons/mime-video-${mime}_192x192.png \
        ${pkgdir}/usr/share/icons/hicolor/192x192/mimetypes/realplay-video-${mime}.png
  done

# setting up locales
  for locale in de es fr hi it ja ko pl pt_BR zh_CN zh_TW; do
    install -d ${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES
 #   rm -f ${pkgdir}/opt/realplayer/share/locale/${locale}/{LICENSE,README}
    ln -s /opt/realplayer/share/locale/${locale}/player.mo \
        ${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES/realplay.mo
    ln -s /opt/realplayer/share/locale/${locale}/widget.mo \
        ${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES/widget.mo
  done

# installing pixmap, .desktop file, etc.
  install -d ${pkgdir}/usr/share/pixmaps
  ln -s /opt/realplayer/share/realplay.png ${pkgdir}/usr/share/pixmaps/realplay.png
  install -D -m 0644 ${pkgdir}/opt/realplayer/share/realplay.applications \
                   ${pkgdir}/usr/share/application-registry/realplay.applications
  install -D -m 0644 ${pkgdir}/opt/realplayer/share/realplay.desktop \
                   ${pkgdir}/usr/share/applications/realplay.desktop
  install -D -m 0644 ${pkgdir}/opt/realplayer/share/realplay.keys \
                   ${pkgdir}/usr/share/mime-info/realplay.keys
  install -D -m 0644 ${pkgdir}/opt/realplayer/share/realplay.mime \
                   ${pkgdir}/usr/share/mime-info/realplay.mime

# installing licence
  install -D -m 0644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

# installing docs for setup assistant
  install -D -m 0644 README ${pkgdir}/opt/realplayer/README
  install -D -m 0644 LICENSE ${pkgdir}/opt/realplayer/LICENSE 
}
