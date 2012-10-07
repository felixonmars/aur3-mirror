# Contributor: spider-mario <spidermario@free.fr>
pkgname=meetbot
pkgver=0.1.4
pkgrel=1
pkgdesc="IRC bot (as a plugin to supybot) to assist in running meetings"
arch=(any)
url="http://wiki.debian.org/MeetBot"
license=('custom:BSD')
depends=('supybot' 'python2-pygments')
makedepends=('darcs')
options=('!strip')
source=(LICENSE)
md5sums=('efd21867a332dd6e594f3bc5038cd450')

build() {
  cd "$srcdir"

  if [ ! -d MeetBot ]; then
    darcs get http://anonscm.debian.org/darcs/collab-maint/MeetBot --tag $pkgver
  fi

  rm -fr MeetBot/_darcs
}

package() {
  cd "$srcdir"

  install --directory "$pkgdir/usr/share/licenses/meetbot"
  cp "$startdir/LICENSE" "$pkgdir/usr/share/licenses/meetbot/"

  install --directory "$pkgdir/usr/lib/python2.7/site-packages/supybot/plugins/"
  cp -r MeetBot "$pkgdir/usr/lib/python2.7/site-packages/supybot/plugins/"
}

# vim:set ts=2 sw=2 et:
