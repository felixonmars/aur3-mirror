# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=screenlets-pack-all
_pkgname=indiv-screenlets
pkgver=0.1.6
pkgrel=1
pkgdesc="Desktop widgets for Screenlets"
arch=('any')
url="http://screenlets.org/"
license=('GPL3')
depends=('screenlets' 'python2-pillow')
makedepends=('dos2unix')
optdepends=('python2-gnomevfs: EvolutionContactsScreenlet, LauncherScreenlet, LyricsScreenlet, PlacesScreenlet, TomboyScreenlet'
            'python2-feedparser: ClearRssScreenlet, FeedReaderScreenlet, FeedReaderPlusScreenlet'
            'python2-pytz: EMHIScreenlet, FreemeteoWeatherScreenlet'
            'python2-gdata: GoogleCalendarScreenlet'
            'python2-numpy: LipikScreenlet, PidginScreenlet'
            'gnome-menus: MainMenuScreenlet'
            'gnome-menus2: MainMenuScreenlet'
            'python2-chardet: PidginScreenlet'
            'mplayer: RadioScreenlet'
            'vte: TerminalScreenlet'
            'python2-xlib: TuxScreenlet'
            'python2-twitter: TwitterScreenlet'
            'python2-dateutil: WorldClockScreenlet')
source=(https://launchpad.net/indiv-screenlets/trunk/$pkgver/+download/$_pkgname-$pkgver.tar.bz2)
md5sums=('d908308a60eecbee13a21917d36b10bc')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Some files are distributed in DOS format...
  find . -name \*.py -exec dos2unix -q '{}' \;

  # Python2 fix
  find . -name \*.py -exec sed -i 's@^#.*python$@#!/usr/bin/python2@' '{}' \;
  sed -i 's@^#.*python$@#!/usr/bin/python2@' src/Lyrics/gui/{ls_widget,afv_widgets}
  sed -i 's@^#.*python $@#!/usr/bin/python2@' src/dayNight/Sun.py
  sed -i 's/python -u/python2 -u/' setup.py src/MainMenu/gnomeApplet.py
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python2 setup.py install --root=$pkgdir/ --optimize=1

  # Remove basic screenlets pack, because these are included also in all screenlets pack
  rm "$pkgdir"/usr/lib/python2.7/site-packages/screenlets_pack_basic-0.1.6-py2.7.egg-info
  rm -r "$pkgdir"/usr/share/applications/screenlets_pack_basic
  rm -r "$pkgdir"/usr/share/screenlets/screenlets-pack-basic

  # Remove EvolutionContactsScreenlet, GooglemapsScreenlet, OSMScreenlet, SpeechScreenlet, WeatherScreenlet and YoutubeScreenlet, because we don't have python2-evolution, python2-gtkmozembed, orca2 and python-numeric
  rm "$pkgdir"/usr/share/applications/screenlets_pack_all/{evolutioncontacts,googlemaps,osm,speech,weather,youtube}-screenlet.desktop
  rm -r "$pkgdir"/usr/share/screenlets/screenlets-pack-all/{EvolutionContacts,Googlemaps,OSM,Speech,Weather,Youtube}
}
