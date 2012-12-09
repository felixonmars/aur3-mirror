# Contributor: Dieter Plaetinck <dieter@plaetinck.be>
pkgname=rss2email-xdg-git
pkgver=20110508
pkgrel=2
pkgdesc="An rss2email fork that sucks less"
arch=('any')
url="http://dieter.plaetinck.be/an_rss2email_fork_that_sucks_less"
license=('GPL')
depends=('python2' 'python2-html2text' 'python2-feedparser')
makedepends=('git')
source=()
md5sums=()

_gitroot="git://github.com/Dieterbe/rss2email.git"
_gitname=xdg
build() {
  msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && git pull origin $_gitname || return 1
  else
    git clone $_gitroot $srcdir/$pkgname-$pkgver || return 1
    cd $srcdir/$pkgname-$pkgver
    git checkout origin/$_gitname || return 1
  fi

  msg "GIT checkout done or server timeout"

  sed -i 's_^#!/usr/bin/python\s*$_#!/usr/bin/python2_' rss2email.py
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
