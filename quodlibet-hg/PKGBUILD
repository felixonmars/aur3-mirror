# Maintainer: Gary van der Merwe <garyvdm@gmail.com>

pkgname="quodlibet-hg"
pkgver=3.0.1.490.11e0b914cf4e
pkgrel=1
pkgdesc="An audio library tagger, manager and player"
arch=('any')
license=('GPL2')
url="http://code.google.com/p/quodlibet/"
depends=('gtk3' 'python2-gobject' 'python2-dbus' 'mutagen' 
         'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-ugly' 
         'gnome-icon-theme')
optdepends=('gst-libav: for ffmpeg (ASF/WMA) support'
            'gst-plugins-bad: for Musepack support'
            'libgpod: for ipod support'
            'python2-feedparser: for audio feeds (podcast) support'
            'libkeybinder3: for the multimedia keys support'
            'media-player-info: for media devices support'
            'cddb-py: for "CDDB Lookup" plugin'
            'python2-musicbrainz2: for "MusicBrainz Lookup" plugin'
            'python2-pyinotify: for "Automatic library update" plugin'
            'kakasi: for "Kana/Kanji Simple Inverter" plugin'
            'zeitgeist: for "Event Logging" plugin'
            'gst-plugins-bad: for "Audio Pitch/Speed" plugin')
conflicts=('quodlibet' 'quodlibet-svn' 'quodlibet-no-exfalso', 'quodlibet-plugins' 'quodlibet-plugins-hg', 'quodlibet-plugins-svn')
provides=('quodlibet' 'quodlibet-plugins' 'quodlibet-plugins-hg')
install=quodlibet.install
makedepends=('mercurial' 'python2' 'intltool')
options=('!makeflags')
source=(hg+https://code.google.com/p/quodlibet/)
sha1sums=(SKIP)

pkgver() {
  cd quodlibet
  hg log -r . --template '{latesttag}.{latesttagdistance}.{node|short}\n' | sed 's|^quodlibet-||'
}

build() {
  cd quodlibet/quodlibet
  python2 setup.py build
}

package() {
  cd quodlibet/quodlibet
  python2 setup.py install --prefix="${pkgdir}/usr"
}


