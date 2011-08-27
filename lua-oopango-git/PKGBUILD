# Contributor: Will Chappell <wtchappell@gmail.com>

pkgname=lua-oopango-git
pkgver=20101024
pkgrel=1
pkgdesc="Lua bindings to pango."
arch=('i686' 'x86_64')
url="git://git.naquadah.org/oopango.git"
license=('GPL')
depends=('pango' 'lua' 'lua-oocairo-git')
makedepends=('git')
conflicts=('lua-oopango')

_gitroot="git://git.naquadah.org/oopango.git"

build() {

  msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && git pull origin || return 1
  else
    git clone $_gitroot $srcdir/$pkgname-$pkgver || return 1
    cd $srcdir/$pkgname-$pkgver
  fi

  msg "GIT checkout done or server timeout"

  ./autogen.sh
  ./configure --prefix=/usr || return 1
  sed -i 's/lua5.1/lua/' configure
  make || return 1
  make \
    POD2MAN=/usr/lib/perl5/core_perl/bin/pod2man \
    DESTDIR="${pkgdir}" install || return 1 
}

# vim:set ts=2 sw=2 et:

