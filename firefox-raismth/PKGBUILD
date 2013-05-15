# Maintainer: speps <speps at aur dot archlinux dot org>

_n=161461
_name=raismth
pkgname=firefox-$_name
pkgver=3.0.4
pkgrel=3
pkgdesc="Rai.tv live channels, vod and replay contents w/o *light (Silverlight/Moonlight)"
arch=(any)
url="http://acab.servebeer.com/"
license=('GPL3')
depends=('firefox')
optdepends=('mplayer: default video player'
            'faad: default audio player')
provides=("$_name")
#source=("$url$_name.xpi")
source=("https://addons.mozilla.org/firefox/downloads/file/$_n/rai_smooth_streaming_player_$pkgname-$pkgver-sm+fx.xpi" "$pkgname-graphic.patch")
md5sums=('fffc91821f1fecb1b9e4bae11eb24c9b'
         '5591c9b5a967caf42edbdd08fb50f5a3')

build() {
  # works with firefox 6+
  sed -i "/maxVersion/s/[1-9]*.\*/*.*/" "$srcdir/install.rdf"

  # firefox 18.x + patch
  patch -p1 -i "$srcdir/${source[1]}" && rm "$srcdir/${source[1]}"
}

package() {
  cd "$srcdir"

  # extension
  install -d "$pkgdir/usr/lib/firefox/browser/extensions/raismth@mitm.rc"
  cp -a *[^xpi] ${pkgdir}/usr/lib/firefox/browser/extensions/*
}

# vim:set ts=2 sw=2 et: