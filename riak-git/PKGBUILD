# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>
# Contributor: lafka <lafa@hackeriet.no>
# Contributor: Albert Chang <albert.chang@gmx.com>
# Contributor: Thomas Mudrunka <harvie@@email..cz> You can also contact me on http://blog.harvie.cz/
# Contributor: zhehao

pkgname=riak-git
pkgver=2.0.0pre12.r0.gcde6428
pkgrel=1
pkgdesc='NOSQL database engine providing decentralized key-value store, flexible map/reduce engine and HTTP/JSON query interface'
arch=('i686' 'x86_64')
license=('APACHE')
url='http://riak.basho.com/'
makedepends=(
    'erlang-nox'
    'java-environment')
backup=('opt/riak/etc/riak.conf')
install='riak.install'
source=(
    "$pkgname"::'git://github.com/basho/riak'
    'riak.service')
md5sums=(
    'SKIP'
    'ed4cda47fc1fad8b0a3fb3858600c578')

pkgver() {
  cd "$srcdir/$pkgname"
  # cutting off 'riak-' prefix that presents in the git tag
  git describe --long | sed -E 's/^riak-//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"

  msg 'Building...'
  make rel
}

package() {
  cd "$srcdir/$pkgname"

  install -d "$pkgdir/opt"
  install -d "$pkgdir/var/log"
  install -d "$pkgdir/etc"
  install -d "$pkgdir/usr/share/doc"

  cp -a "rel/riak" "$pkgdir/opt/riak"
  chmod -R 755 "$pkgdir/opt/riak/bin"
  ln -s /opt/riak/log "$pkgdir/var/log/riak"
  ln -s /opt/riak/etc "$pkgdir/etc/riak"
  cp -R "doc/man" "$pkgdir/usr/share"
  cp -R "doc" "$pkgdir/usr/share/doc/riak"
  rm -R "$pkgdir/usr/share/doc/riak/man"
  chmod -R 755 "$pkgdir/usr/share"

  # install daemon
  install -D "$srcdir/riak.service" "$pkgdir/usr/lib/systemd/system/riak.service"
}
