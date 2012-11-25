# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=buddycloud-webclient-git
_pkgname=buddycloud-webclient
pkgver=20121120
pkgrel=1
pkgdesc="A fully distributed social network based on XMPP - web client"
arch=(any)
url="https://buddycloud.org/wiki/Main_Page"
license=('Apache')
depends=('buddycloud-http-api-git')
makedepends=('git')
optdepends=('apache: a high performance HTTP server'
            'lighttpd: a secure, fast and very flexible web server'
            'nginx: a lightweight HTTP server')
provides=('buddycloud-webclient')
conflicts=('buddycloud-webclient')
backup=("etc/webapps/$_pkgname/config.js")

_gitroot=git://github.com/buddycloud/webclient.git
_gitname=webclient

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
}

package() {
  install -d "$pkgdir/usr/share/webapps"
  cd "$pkgdir/usr/share/webapps"
  git clone "$srcdir/$_gitname" "$_pkgname"
  rm -rf "$_pkgname/.git"

  cd "$_pkgname"
  install -Dm644 config.js "$pkgdir/etc/webapps/$_pkgname/config.js"
  rm config.js
  ln -s "../../../../etc/webapps/$_pkgname/config.js" config.js
}

# vim:set ts=2 sw=2 et:
