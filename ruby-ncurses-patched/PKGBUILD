# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Jeff Mickey <j@codemac.net>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
# Contributor: Bersam Karbasion <bersam.k@gmail.com>

pkgname=ruby-ncurses-patched
pkgver=1.3.1
pkgrel=1
pkgdesc='Module for interactive text console applications (ncurses)'
arch=('x86_64' 'i686')
url='http://ncurses-ruby.berlios.de/'
license=('GPL')
depends=('ruby' 'ncurses')
conflicts=('ruby-ncurses')
source=("http://download.berlios.de/ncurses-ruby/ncurses-ruby-$pkgver.tar.bz2"
        'http://pkgs.fedoraproject.org/cgit/ruby-ncurses.git/plain/0001-STR2CSTR-deprecated.patch')

sha256sums=('dca8ce452e989ce1399cb683184919850f2baf79e6af9d16a7eed6a9ab776ec5'
            '3a9fea87a0fa3eac58022e9e86e901601953939c15ebccede0ba64f4a011039d')

build() {
  cd "$srcdir/ncurses-ruby-$pkgver"
 
  patch -Np1 -i ../0001-STR2CSTR-deprecated.patch

  chmod 0644 ncurses_wrap.c
  ruby extconf.rb --vendor
  make
}

package() {
  cd "$srcdir/ncurses-ruby-$pkgver"

  make includedir="/usr/include" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
