# Maintainer: TJ Vanderpoel <tj@rubyists.com>
pkgname=riak-search
pkgver=0.14.0
pkgrel=11
pkgdesc="A distributed, easily-scalable, failure-tolerant, real-time, full-text search engine built around Riak Core and tightly integrated with Riak KV."
arch=(i686 x86_64)
url="http://wiki.basho.com/Riak-Search.html"
license=('Apache 2')
depends=('erlang' 'jre' 'spidermonkey')
makedepends=('jdk' 'git' 'apache-ant')
provides=(riak)
replaces=(riak)
conflicts=(riak)
install=riaksearch.install
source=(http://downloads.basho.com/riak-search/riak-search-0.14/riak_search-0.14.0-1.tar.gz riaksearch.rc)
md5sums=('c784e42fbc306f84f799ebc780f20acb'
         'e4b885913e15f766fedf2a63a801a5d9')

build() {
  cd "$srcdir/riak_search-$pkgver"
  source /etc/profile.d/apache-ant.sh
  msg Cleaning
  make distclean
  # need to unset LDFLAGS because: ld: unrecognized option '-Wl,--hash-style=gnu'
  unset LDFLAGS
  msg Building
  make rel
  sed -i -e 's/^RUNNER_USER=$/RUNNER_USER=riak/' \
         -e 's|^RUNNER_SCRIPT_DIR=.*$|RUNNER_SCRIPT_DIR=/opt/riaksearch/bin|' \
         ./rel/riaksearch/bin/*
}

package() {
  msg Packaging
  install -d "$pkgdir/opt/riaksearch/"
  install -d "$pkgdir/etc/rc.d"
  install -d "$pkgdir/var/log/"
  install -d "$pkgdir/usr/share/doc/"
  install -d "$pkgdir//usr/bin/"

  cd "$srcdir/riak_search-$pkgver/rel/"
  cp -a riaksearch/* "$pkgdir/opt/riaksearch/"
  chmod -R 755 "$pkgdir/opt/riaksearch/bin"

  ln -s /opt/riaksearch/log "$pkgdir/var/log/riaksearch"
  ln -s /opt/riaksearch/etc "$pkgdir/etc/riaksearch"
  cp -r "${srcdir}/riak_search-${pkgver}/doc/man" "$pkgdir/usr/share/"
  cp -r "${srcdir}/riak_search-${pkgver}/doc" "$pkgdir/usr/share/doc/riaksearch"
  rm -r "${pkgdir}/usr/share/doc/riaksearch/man"
  
  ln -s /opt/riaksearch//bin/riaksearch "$pkgdir/usr/bin/riaksearch"
  ln -s /opt/riaksearch/bin/riaksearch-admin "$pkgdir/usr/bin/riaksearch-admin"
  ln -s /opt/riaksearch/bin/search-cmd "$pkgdir/usr/bin/search-cmd"
  cp $srcdir/riaksearch.rc "$pkgdir/etc/rc.d/riaksearch"
  chmod 755 "$pkgdir/etc/rc.d/riaksearch"
}
