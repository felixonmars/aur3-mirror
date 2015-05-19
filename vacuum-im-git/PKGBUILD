# Maintainer: KsenZ <aksenzov@gmail.com>

pkgname=vacuum-im-git
pkgver=20150518
pkgrel=1
pkgdesc="Full-featured crossplatform Jabber/XMPP client."
arch=('x86_64')
url="http://www.vacuum-im.org/"
license=('GPL3')
conflicts=('vacuum' 'vacuum-snv')
provides=('vacuum')
replaces=('vacuum' 'vacuum-svn')
depends=('qt4>=4.8.0' 'libidn' 'openssl' 'zlib')
makedepends=('git')

_gitroot=https://github.com/Vacuum-IM/vacuum-im.git
_gitname=vacuum-im

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."
 
  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
    cd "$_gitname"
  fi

  qmake-qt4 INSTALL_PREFIX=/usr CONFIG-=debug_and_release CONFIG-=debug -recursive vacuum.pro
  make -j$(nproc)
}

package() {
  cd $_gitname
  make INSTALL_ROOT="${pkgdir}" install
}