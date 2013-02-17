# Maintainer: Matthew Bentley <matthew.t.bentley@gmail.com>
pkgname=znc-bot
pkgver=20130216
pkgrel=1
pkgdesc="A bot api for znc"
arch=("any")
url="https://github.com/kylef/znc-bot"
license=('unknown')
makedepends=('git')
depends=('znc' 'python2')

_gitroot="git://github.com/kylef/znc-bot.git"
_gitname="znc-bot"

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
  msg "Starting make..."

}

package() {
  cd "$srcdir"
  mkdir -p ${pkgdir}/usr/lib/znc/modpython/bot/
  install -Dm755 znc-bot/bot/api.py ${pkgdir}/usr/lib/znc/modpython/bot/
  install -Dm755 znc-bot/bot/events.py ${pkgdir}/usr/lib/znc/modpython/bot/
  install -Dm755 znc-bot/bot/http.py ${pkgdir}/usr/lib/znc/modpython/bot/
  install -Dm755 znc-bot/bot/__init__.py ${pkgdir}/usr/lib/znc/modpython/bot/
  install -Dm755 znc-bot/bot/module.py ${pkgdir}/usr/lib/znc/modpython/bot/

  install -Dm755 znc-bot/dns.py ${pkgdir}/usr/lib/znc/modpython/
  install -Dm755 znc-bot/gem.py ${pkgdir}/usr/lib/znc/modpython/
  install -Dm755 znc-bot/isup.py ${pkgdir}/usr/lib/znc/modpython/
  install -Dm755 znc-bot/rand.py ${pkgdir}/usr/lib/znc/modpython/
  install -Dm755 znc-bot/security.py ${pkgdir}/usr/lib/znc/modpython/
  install -Dm755 znc-bot/sed.py ${pkgdir}/usr/lib/znc/modpython/
  install -Dm755 znc-bot/urban.py ${pkgdir}/usr/lib/znc/modpython/
  install -Dm755 znc-bot/wordnik.py ${pkgdir}/usr/lib/znc/modpython/
}
