# Maintainer: Vítor Ferreira <vitor.dominor at gmail dot com>
# Contributor: Andrei Gutu
# text : The new mediaplayer from ROSA(based on SMPlayer)

pkgname=rosa-media-player
pkgver=1.6.9
pkgrel=2
pkgdesc="The new multimedia player(based on SMPlayer) with clean and elegant UI."
arch=(i686 x86_64)
url=http://www.koryavov.net/2012/09/rosa-media-player-15.html
# Alternative url is that of official git repo for the rosa media player project:
# https://abf.rosalinux.ru/uxteam/ROSA_Media_Player
# or rosalinux mirror
# http://mirror.yandex.ru/rosa/rosa2012.1/repository/SRPMS/main/release/

_upstream_rel=1

source=(https://github.com/Dominor/aur/raw/master/$pkgname/$pkgname-$pkgver.tar.gz)
# end source URL with sha1sum taken from https://abf.rosalinux.ru/import/rosa-media-player/raw/rosa2012.1/.abf.yml
#source=(http://file-store.rosalinux.ru/download/72deb4712f996c52fa5e769cc0036d3ffc15958d)
license=(GPL)
depends=('mplayer' 'wget' 'qjson')
optdepends=('mencoder: video splitting support'
            'ffmpeg: audio cutting and video recording support'
            'rosa-media-player-plugin: mozilla plugin'
            'wildmidi: midi support'
            'timidity-freepats: midi support')
makedepends=('qt4' 'qjson')
install="$pkgname".install
sha1sums=('72deb4712f996c52fa5e769cc0036d3ffc15958d')

build()
{
  cd "$srcdir/$pkgname"
  ./get_romp_version.sh $pkgver $_upstream_rel
  make PREFIX=/usr QMAKE=/usr/bin/qmake-qt4 LRELEASE=/usr/lib/qt4/bin/lrelease no-midi-support
}

package()
{
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
