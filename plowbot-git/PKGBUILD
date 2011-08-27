# Maintainer: Christophe-Marie Duquesne <chm.duquesne@gmail.com>

pkgname=plowbot-git
pkgver=20110727
pkgrel=1
pkgdesc="A minimalist jabber bot for plowshare"
arch=(any)
url="https://github.com/chmduquesne/plowbot"
license=('WTFPL')
depends=('plowshare' 'pyxdg' 'jabberbot')
makedepends=('git')
provides=('plowbot')
conflicts=('plowbot')
install=plowbot.install
backup=(etc/conf.d/plowbot)
source=('plowbot.rc' 'plowbot.conf')
md5sums=('f8ffec22e2cee47d72424ed70c10a47b'
         '2c89768cb981589ec392dbedd0cfde52')

_gitroot="https://github.com/chmduquesne/plowbot"
_gitname="plowbot"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"

  install -Dm755 $srcdir/$_gitname/plowbot.py $pkgdir/usr/bin/plowbot
  install -Dm755 $srcdir/plowbot.rc $pkgdir/etc/rc.d/plowbot
  install -Dm644 $srcdir/plowbot.conf $pkgdir/etc/conf.d/plowbot
}
