# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=screenlets-pack-full-bzr
pkgver=0.1.7.1240.2ab8a6d
pkgrel=1
pkgdesc="Desktop widgets for Screenlets (bzr version)"
arch=(any)
url="http://screenlets.org/"
license=('GPL')
depends=('screenlets')
makedepends=('bzr')
optdepends=('imagemagick: Now Playing Screenlet'
            'python2-chardet: Pidgin Screenlet'
            'python2-feedparser: Feed Reader and ClearRSS Screenlets'
            'python-gdata: Google Calendar Screenlet'
            'python-imaging: DayNight, Lyrics, PicFrame, Lipik, Wallpaper Clock'
            'python-mpd: Now Playing Screenlet'
            'python-numpy: Pidgin and Lipik Screenlets'
            'python2-oauth2: Twitter Screenlet'
            'python2-pytz: Freemeteo Weather Screenlet'
            'python-simplejson: Lyrics Screenlet'
            'python2-twitter: Twitter Screenlet'
            'python-xlib: Tux Screenlet')
provides=('screenlets-pack-basic' 'screenlets-pack')
conflicts=('screenlets-pack-basic' 'screenlets-pack')
source=('screenlets-pack::bzr+http://bazaar.launchpad.net/~indiv-screenlets-dev/indiv-screenlets/trunk')
md5sums=('SKIP')

pkgver() {
    cd screenlets-pack
    echo $(cat VERSION).$(bzr revno).$(bzr testament | awk '/sha1/ { print $2 }' | head -c7)
}

package() {
  cd screenlets-pack

  # Python2 fix
  find . -name \*.py -exec sed -i 's@/usr/bin/python@/usr/bin/python2@' {} \;
  find . -name \*.py -exec sed -i 's@/usr/bin/env python@/usr/bin/python2@' {} \;
  sed -i 's@^#.*python$@#!/usr/bin/python2@' src/Lyrics/gui/{ls_widget,afv_widgets}
  sed -i 's/python -u/python2 -u/' setup.py
  
  # Fix desktop files
  sed -i 's/desktop_file % (podir, packname, podir, podir)/desktop_file % (podir, normal_packname, podir, podir)/' setup.py
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

#Provided by screenlet package, so don't need to be in optdepends
# python-gobject: Folder View Screenlet
# python-rsvg: Now Playing Screenlet
# python-webkit: Flip Clock and Web Frame Screenlets
