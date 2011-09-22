# Maintainer: Jeremy Newton (Mystro256)

pkgname=mailme-git
pkgver=20110922
pkgrel=1
pkgdesc="Mailme is Yet Another 'You've got mail!' notifier, effectively adding email notification to telepathy/empathy. Works with telepathy accounts to produce mail notification."
arch=('i686' 'x86_64')
url="https://github.com/jku/mailme"
license=('LGPL2.1')
depends=('telepathy-mission-control')
makedepends=('git' 'intltool')
optdepends=('telepathy-gabble: XMPP/Jabber support'
            'telepathy-butterfly: MSN support'
            'telepathy-idle: IRC support'
            'telepathy-salut: Link-local XMPP support'
            'telepathy-sofiasip: SIP support'
            'telepathy-haze: libpurple support')
source=('mailme.desktop')
md5sums=('c2af928c5a0878039077bc09a1d691ae')

_gitroot='git://github.com/jku/mailme.git'
_gitname='mailme'

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

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # Build...

  ./autogen.sh --prefix=${pkgdir}/usr
  make
  make install
}
package() {
  install -D -Dm664 $srcdir/mailme.desktop "$pkgdir/etc/xdg/autostart/mailme.desktop"
} 

