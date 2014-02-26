# Maintainer: TJ Vanderpoel <tj@rubyists.com>
pkgname=lighttpd2-git
pkgver=20140225
pkgrel=3
pkgdesc="The new Lighty: A small, secure, scalable, flexible webserver"
arch=(i686 x86_64)
url="http://redmine.lighttpd.net/wiki/lighttpd2/"
license=('MIT')
depends=(libev ragel lua51 zlib bzip2 openssl glib2 runit runit-services)
optdepends=("valgrind: for deep debuggins")
makedepends=(pkg-config)
backup=('etc/lighttpd2/lighttpd.conf' 'etc/lighttpd2/angel.conf' 'etc/lighttpd2/mimetypes.conf')
install=lighttpd2.install

_gitroot="git://git.lighttpd.net/lighttpd/lighttpd2.git"
_gitname="lighttpd2"
source=("README" $_gitroot)


build() {
  cd "$srcdir"

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  ./autogen.sh
  ./configure --prefix=/usr --with-lua --with-openssl --with-kerberos5 --with-zlib --with-bzip2 --includedir=/usr/include/lighttpd-2.0.0
  make
  sed -i -e 's/^docroot "\/var\/www";/docroot "\/srv\/http";/' contrib/lighttpd.conf
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  install -D -m0755 -d "$pkgdir/usr/share/doc/lighttpd2"
  cp -a doc/* "$pkgdir/usr/share/doc/lighttpd2/"
  install -D -d "$pkgdir/etc/sv/lighttpd2"
  install -D -d "$pkgdir/var/log/lighttpd2"

  install -D -m0644 contrib/lighttpd.conf "$pkgdir/etc/lighttpd2/lighttpd.conf"
  install -D -m0644 contrib/angel.conf "$pkgdir/etc/lighttpd2/angel.conf"
  install -D -m0644 contrib/mimetypes.conf "$pkgdir/etc/lighttpd2/mimetypes.conf"
} 
md5sums=('18c5a930998b90a76e85389d73ecd639'
         'SKIP')
