# $Id: PKGBUILD 40783 2011-02-27 01:50:59Z allan $
# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Sven Pfleiderer <pfleidi@roothausen.de>

pkgname=stfl-ruby
_lib=stfl
pkgver=0.22
pkgrel=3
pkgdesc="Library implementing a curses-based widget set for text terminals, Ruby bindings"
arch=('i686' 'x86_64')
url="http://svn.clifford.at/stfl/trunk/ruby/example.rb"
license=('GPL3')
depends=('ncurses' 'stfl' 'ruby')
makedepends=('patch' 'swig')
options=('!libtool')
changelog=$_lib.changelog
source=(http://clifford.at/stfl/$_lib-$pkgver.tar.gz \
        $_lib-archlinux.patch)
md5sums=('df4998f69fed15fabd702a25777f74ab'
         'a6231f269038c76a54fd08d6417f3d6d')
sha256sums=('2dddafd331e61ad04baf1251ccecb3a69feaf99880dd75155be8423c1cc55418'
            'c7d7c787bcd287a776aad3b26e6a90a3b121c281125c34c7c35a87f36dcdc453')

build() {
  cd ${srcdir}/$_lib-$pkgver

  patch -Np1 -i ${srcdir}/$_lib-archlinux.patch

  make FOUND_RUBY=1 prefix=/usr Makefile.deps
  make FOUND_RUBY=1 prefix=/usr
}

package() {
  cd ${srcdir}/$_lib-$pkgver

  make FOUND_RUBY=1 prefix=/usr DESTDIR=${pkgdir} install_ruby
}
