# Maintainer: Linus Sjögren <thelinx@unreliablepollution.net>
pkgname=lua-ircbot-git
pkgver=20110620
pkgrel=1
pkgdesc="IRC bot framework in Lua"
arch="any"
url="https://github.com/JakobOvrum/ircbot"
license=('MIT')
provides=('lua-ircbot')
depends=('lua' 'lua-irc')
makedepends=('git')

_gitroot="$url.git"
_gitname="ircbot"

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
  msg "Installing..."

  #
  # BUILD HERE
  #

  cd "$srcdir/$_gitname"
	mkdir -p $pkgdir/usr/share/lua/5.1/ircbot/plugins/
	install -Dm0664 *.lua \
		$pkgdir/usr/share/lua/5.1/ircbot/
    install -Dm0664 plugins/*.lua \
        $pkgdir/usr/share/lua/5.1/ircbot/plugins/
	install -Dm0664 LICENSE.txt \
		$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
} 
