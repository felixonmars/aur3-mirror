# Maintainer: Mr.Elendig <mrelendig@har-ikkje.net> 
# Contributor: intnull <intnull@rocketmail.com>

pkgname=videotop-git
pkgver=20111001.27
pkgrel=1
pkgdesc="A console browser for online videos for websites like YouTube"
arch=(any)
url="https://github.com/intnull/videotop"
license=('GPL')
depends=('python2-urwid' 'python2-gdata' 'youtube-dl')
optdepends=('mplayer: to play videos')
makedepends=('git')
provides=('videotop')
source=('git://github.com/intnull/videotop.git')
sha1sums=('SKIP')

pkgver() {
  cd videotop
  _d=$(git log -n 1 --pretty=%ad --date=short | sed 's/-//g')
  _c=$(git log --pretty=%h | wc -l)
  printf '%s.%s' $_d $_c
}

package() {
  cd videotop
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
