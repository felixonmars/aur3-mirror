# Maintainer: TJ Vanderpoel <tj@rubyists.com>
pkgname=riak-search
pkgver=0.14.0
pkgrel=17
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
source=(http://downloads.basho.com/riak-search/riak-search-0.14/riak_search-0.14.0-1.tar.gz riaksearch.rc riaksearch.profile.d.csh riaksearch.profile.d.sh riaksearch.sudo)
md5sums=('c784e42fbc306f84f799ebc780f20acb'
         'd17b59fe2df78c186ac459fea8f81b9f'
         '2b600b8e2d0cf31641a824d202b9065f'
         'dc64500c1d5cc787cb07f3ec917899f7'
         '21a8b619880ea73fdfe1c60db4dbc3d4')

build() {
  cd "$srcdir/riak_search-$pkgver"

  # Bring in java/ant environment
  source /etc/profile.d/jdk.sh 
  source /etc/profile.d/jre.sh 
  source /etc/profile.d/apache-ant.sh

  msg Cleaning
  make distclean # Comment out to reuse src build
  #[ -d rel/riaksearch ] && rm -r rel/riaksearch # Uncomment if you comment out the above

  # need to unset LDFLAGS because: ld: unrecognized option '-Wl,--hash-style=gnu'
  unset LDFLAGS

  msg Building
  make rel
  sed -i -e 's/^RUNNER_USER=$/RUNNER_USER=riak/' \
         -e 's|^RUNNER_SCRIPT_DIR=.*$|RUNNER_SCRIPT_DIR=/var/lib/riaksearch/bin|' \
         ./rel/riaksearch/bin/*
}

package() {
  msg Packaging
  _riakhome="/var/lib/riaksearch/"
  _riakpkg="${pkgdir}${_riakhome}"
  install -d "$_riakpkg" "$pkgdir/usr/share/doc" "$pkgdir/var/log" "$pkgdir/etc"

  cd "$srcdir/riak_search-$pkgver/rel/"
  cp -a riaksearch/{bin,data,erts-5.8.1,lib,releases} "$_riakpkg"
  chmod -R 755 "${_riakpkg}bin"

  cp -a riaksearch/log "$pkgdir/var/log/riaksearch"
  ln -s /var/log/riaksearch "${_riakpkg}log"

  cp -a riaksearch/etc "$pkgdir/etc/riaksearch"
  ln -s /etc/riaksearch "${_riakpkg}etc" 

  cp -a "${srcdir}/riak_search-${pkgver}/doc/man" "$pkgdir/usr/share/"
  cp -a "${srcdir}/riak_search-${pkgver}/doc" "$pkgdir/usr/share/doc/riaksearch"
  rm -r "${pkgdir}/usr/share/doc/riaksearch/man"
  
  install -m 0755 -D "$srcdir/riaksearch.rc" "$pkgdir/etc/rc.d/riaksearch"
  install -m 0750 -D "$srcdir/riaksearch.profile.d.sh" "$pkgdir/etc/profile.d/riaksearch.sh"
  install -m 0750 -D "$srcdir/riaksearch.profile.d.csh" "$pkgdir/etc/profile.d/riaksearch.csh"
  install -m 0440 -D "$srcdir/riaksearch.sudo" "$pkgdir/etc/sudoers.d/riaksearch"
  chmod 750 "$pkgdir/etc/sudoers.d"
}
