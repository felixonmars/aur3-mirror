# Maintainer: Jan Path <jan.path@linux.com>

# AUR workaround for split packages
pkgname=quodlibet2
true && pkgbase=quodlibet2
true && pkgname=('quodlibet2' 'quodlibet2-plugins')

pkgver=2.6.3
pkgrel=1
arch=('any')
license=('GPL2')
url="http://code.google.com/p/quodlibet/"
makedepends=('python2' 'intltool')
options=('!makeflags')
source=(https://bitbucket.org/lazka/quodlibet-files/raw/default/releases/quodlibet-$pkgver.tar.gz
        https://bitbucket.org/lazka/quodlibet-files/raw/default/releases/quodlibet-plugins-$pkgver.tar.gz)
sha1sums=('a196e04d121f7dd85af43efe97e11f49d965b88a'
          '823b519215603467925fbbcc99c5cff8aba395b1')

prepare() {
  find quodlibet-${pkgver} quodlibet-plugins-${pkgver} -type f -executable -exec \
    sed -i '1s|^#!.*python$|#!/usr/bin/env python2|' '{}' \;
}

build() {
  cd quodlibet-${pkgver}
  python2 setup.py build
}

package_quodlibet2() {
  pkgdesc="Legacy Gstreamer0.10 branch of QuodLibet an audio library tagger, manager and player."
  depends=('gtk3' 'pygtk' 'python2-dbus' 'mutagen' 
           'gstreamer0.10-base-plugins' 'gstreamer0.10-good-plugins' 'gstreamer0.10-ugly-plugins' 
           'gnome-icon-theme')
  provides=("quodlibet=${pkgver}")
  conflicts=('quodlibet' 'quodlibet-hg')
  optdepends=('gstreamer0.10-libav: for ffmpeg (ASF/WMA) support'
              'gstreamer0.10-bad-plugins: for Musepack support'
              'libgpod: for ipod support'
              'python2-feedparser: for audio feeds (podcast) support'
              'libkeybinder3: for the multimedia keys support'
              'media-player-info: for media devices support')
  install=quodlibet2.install

  cd quodlibet-${pkgver}
  python2 setup.py install --prefix="${pkgdir}/usr"
}

package_quodlibet2-plugins() {
  pkgdesc="Various plugins for QuodLibet 2.x"
  depends=('quodlibet2')
  provides=("quodlibet-plugins=${pkgver}")
  conflicts=('quodlibet-plugins' 'quodlibet-plugins-hg')
  optdepends=('cddb-py: for "CDDB Lookup" plugin'
              'python2-musicbrainz2: for "MusicBrainz Lookup" plugin'
              'python2-pyinotify: for "Automatic library update" plugin'
              'kakasi: for "Kana/Kanji Simple Inverter" plugin'
              'zeitgeist: for "Event Logging" plugin'
              'gstreamer0.10-bad-plugins: for "Audio Pitch/Speed" plugin')

  cd quodlibet-plugins-${pkgver}
  install -d "${pkgdir}/usr/lib/python2.7/site-packages/quodlibet/plugins"
  cp -r editing events gstreamer playorder songsmenu\
    "${pkgdir}/usr/lib/python2.7/site-packages/quodlibet/plugins"
}

# AUR workaround for split packages
pkgdesc="Legacy Gstreamer0.10 branch of QuodLibet an audio library tagger, manager and player.  \
         Split package including quodlibet2-plugins."
# ex: set et sw=2 ts=2:
