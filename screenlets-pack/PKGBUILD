# $Id$
# Maintainer:
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: javonera <javonera@gmail.com>
# Contributor: Artiom MOLCHANOV <ar.molchanov@gmail.com>

pkgname=screenlets-pack
_pkgname=indiv-screenlets
pkgver=0.1.6
pkgrel=1
pkgdesc="Desktop widgets for Screenlets"
arch=('any')
url="https://launchpad.net/indiv-screenlets"
license=('GPL3')
depends=('screenlets-core')
optdepends=('tomboy:              Tomboy Screenlet'
            'python-gdata:        Google Calendar Screenlet'
            'python2-gtkmozembed: Google Maps / Webframe Screenlet'
            'gnome-menus:         Main Menu Screenlet'
            'python-imaging:      Wallpaper Clock / Photo Wall / Slide Show Screenlets'
            'python2-feedparser:  Feed Reader Screenlet'
            'dropbox:             Dropbox Screenlet'
            'python2-numpy:       Lipik Screenlet'
            'nvidia-settings:     NVIDIA Screenlet'
            'pidgin:              Pidgin Screenlet'
            'mplayer:             Mplayer Screenlet'
            'orca:                Speech Screenlet'
            'python-twitter:      Twitter Screenlet'
            'python-evolution:    Evolution Contacts Screenlet'
            'alsa-utils:          Volume Control Screenlet'
            'python2-pytz: for time zones in clocks'
	    'python2-solartz: for solar time clocks'
	    )

source=(setup.patch screenlets.install https://launchpad.net/$_pkgname/trunk/$pkgver/+download/$_pkgname-$pkgver.tar.bz2)
install=screenlets.install
conflicts=(screenlets)

md5sums=('9d52ea3e1f7fe61a48605a3e3df0f269'
         '31259904c09ae34206219c6f13f04723'
         'd908308a60eecbee13a21917d36b10bc')


build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  rm -Rf "src/Lyrics/Quodlibet plugin"
  for _file in $( find ./src -name "*.py" ) ; do 
    sed -i 's:exec python:&2:g' "${_file}"
    sed -i 's:/usr/bin/env python:&2:g' "${_file}"
    sed -i 's:/usr/bin/python:&2:g' "${_file}"
  done
  patch -p0 -i ${srcdir}/setup.patch
}
package() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  python2 setup.py install --root="$pkgdir"
 
}
