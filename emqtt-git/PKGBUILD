# Contributor: Hippo <kimiscircle@gmail.com>

pkgname=emqtt-git
pkgver=20150409
pkgrel=1
pkgdesc="Distributed MQTT v3.1 Broker Written In Erlang http://emqtt.io"
arch=('i686' 'x86_64')
url="http://github.com/emqtt/emqttd"
license=('MIT')
depends=('erlang')
makedepends=('git')

_gitroot="http://github.com/emqtt/emqttd.git"
_gitname="emqttd"

build() {
  cd "$srcdir"

  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  cd "$srcdir"/$_gitname

  make || return 1
}

package(){
  mkdir -p "$pkgdir"/usr/lib/erlang/lib/"$_gitname"
  mkdir -p "$pkgdir"/usr/local/bin/
  cp ./"$_gitname"/* -R "$pkgdir"/usr/lib/erlang/lib/"$_gitname"
  ln -s /usr/lib/erlang/lib/"$_gitname"/rel/files/emqttd "$pkgdir"/usr/local/bin/
  ln -s /usr/lib/erlang/lib/"$_gitname"/rel/files/emqttd_ctl "$pkgdir"/usr/local/bin/
}
