# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: xbj9000 <xbj9000@comcast.net>

_commit=6783474c4e6fbbf5d6c68e36974080d3dad75391
pkgname=prpltwtr
pkgver=0.12.0.r392
pkgrel=1
pkgdesc="A libpurple plugin which treats microblogging (Twitter, identi.ca) as IM protocols"
arch=(i686 x86_64)
url="http://code.google.com/p/prpltwtr/"
license=('GPL')
depends=('libpurple' 'json-glib')
makedepends=('pidgin' 'intltool' 'libtool')
optdepends=('pidgin: gtk prpltwtr plugin')
options=('!libtool' '!buildflags' '!makeflags' '!strip')
#source=("http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz")
source=("https://github.com/dmoonfire/prpltwtr/archive/$_commit.tar.gz")
md5sums=('b54f561cddd2882bb1f999d9346c5101')

prepare() {
  cd $pkgname-$_commit
  # use HTTPS forcedly for authorization
  sed -i 's/http/&s/' src/prpltwtr/prpltwtr_auth.c
}

build() {
  cd $pkgname-$_commit
  export CFLAGS+=" -g"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$_commit
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
