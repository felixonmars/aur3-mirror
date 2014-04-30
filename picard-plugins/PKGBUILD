# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=picard-plugins
_pkgname=picard
pkgver=1.2
pkgrel=9
pkgdesc="Plugins for MusicBrainz Picard"
arch=('any')
url="http://musicbrainz.org/doc/MusicBrainz_Picard/Plugins"
license=('GPL')
depends=('picard')
replaces=('picard-plugins-lastfmplus')
conflicts=('picard-plugins-lastfmplus')
source=("http://ftp.musicbrainz.org/pub/musicbrainz/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('d1086687b7f7b0d359a731b1a25e7b66')

package() {
  plugindir="${pkgdir}/usr/lib/python2.7/site-packages/picard/plugins"
  cd "${srcdir}/$_pkgname-$pkgver"
  cd "contrib/plugins"
  install -d "$plugindir"
  install -m644 -t "$plugindir" *.py

  install -d "$plugindir/lastfm"
  install -m644 -t "$plugindir/lastfm" lastfm/*.py lastfm/*.ui

  install -d "$plugindir/lastfmplus"
  install -m644 -t "$plugindir/lastfmplus" lastfmplus/*.py

  install -d "$plugindir/replaygain"
  install -m644 -t "$plugindir/replaygain" replaygain/*.py replaygain/*.ui
}

# vim:set ts=2 sw=2 et:
