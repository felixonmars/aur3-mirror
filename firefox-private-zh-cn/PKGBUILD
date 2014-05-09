#! /bin/bash
# Contributor: Kyro <chris-bos-lee@hotmail.com>

pkgname=firefox-private-zh-cn
pkgver=29.0.1
_pkgver=29.x
pkgrel=1
pkgdesc='gcc -O3 SSE2, betterpgo, support for media-libs/gstreamer, add a MOZILLA_DISABLE_PLUGINS environment variable to firefox.'
url='http://sourceforge.net/projects/libportable/'
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types'
         'dbus-glib' 'alsa-lib' 'desktop-file-utils' 'hicolor-icon-theme'
         'libvpx' 'libevent' 'icu' 'nss' 'hunspell' 'sqlite')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'gstreamer0.10-base-plugins: vorbis decoding, ogg demuxing'
            'gstreamer0.10-bad-plugins: aac, vp8 and opus decoding'
            'gstreamer0.10-good-plugins: webm and mp4 demuxing'
            'gstreamer0.10-ugly-plugins: h.264 decoding'
            'gstreamer0.10-ffmpeg: more decoding'
            'libpulse: PulseAudio audio driver')
source=("http://jaist.dl.sourceforge.net/project/libportable/Firefox/x86_64/${_pkgver}/firefox_${pkgver}.zh_CN.linux_x86_64.tar.gz")
sha1sums=('0b89d2cebc2b2f655e173ac120000a53f4ba4418')

install=firefox-private.install

package(){
      msg2 "cd"
      cd "${srcdir}"/firefox_"$pkgver"_setup/
      
      msg2 "extract deb"
      ar vx firefox-private-"$pkgver".zh-CN.linux-x86_64.deb
      
      msg2 "Installing "$pkgname"..."
      tar xzf data.tar.gz -C "${pkgdir}"/
      
      msg2 "Cleaning up unwanted files..."
      rm -rv "${pkgdir}"/usr/lib/firefox-addons/plugins/libaliedit64.so
      rm -rv "${pkgdir}"/usr/lib/firefox-addons/plugins/libflashplayer.so
}

# vim:set ts=2 sw=2 et:
