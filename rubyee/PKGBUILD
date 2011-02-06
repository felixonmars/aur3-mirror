# Contributor: fazibear <fazibear@gmail.com>
pkgname=rubyee
pkgver=1.8.6
_pkgver=20080810
_preftoolsver=0.98
pkgrel=1
pkgdesc="Ruby Enterprise Edition"
arch=(i686)
url="http://www.rubyenterpriseedition.com/"
license=('custom')
depends=(zlib openssl gcc)
source=("http://rubyforge.org/frs/download.php/41040/ruby-enterprise-${pkgver}-${_pkgver}.tar.gz")
md5sums=('bfdcf06f437af825cd9f2d321f9d1896')
build() {
  cd "${startdir}/src/ruby-enterprise-${pkgver}-${_pkgver}/source/vendor/google-perftools-${_preftoolsver}"
  ./configure --disable-dependency-tracking
  make libtcmalloc_minimal.la || return 1
  install -d ${startdir}/pkg/opt/rubyee/lib/
  cp .libs/libtcmalloc_minimal.so* ${startdir}/pkg/opt/rubyee/lib/

  cd "${startdir}/src/ruby-enterprise-${pkgver}-${_pkgver}/source/"
  ./configure --enable-shared --enable-pthread --prefix=/opt/rubyee
  make EXTLIBS="-Wl,-rpath,${startdir}/pkg/opt/rubyee/lib/ -L${startdir}/pkg/opt/rubyee/lib/ -ltcmalloc_minimal"
  make DESTDIR="$startdir/pkg" install
  
  install -d $startdir/pkg/usr/bin
  for binary in erb gem irb rake rdoc ri ruby; do
    ln -sf /opt/rubyee/bin/${binary} ${startdir}/pkg/usr/bin/${binary}ee
  done

  cd "${startdir}/src/ruby-enterprise-${pkgver}-${_pkgver}/rubygems"
  ${startdir}/pkg/opt/rubyee/bin/ruby setup.rb --prefix=${startdir}/pkg/opt/rubyee/lib/ruby/1.8 --no-ri --no-rdoc
  
  cp -r ${startdir}/pkg/opt/rubyee/lib/ruby/1.8/lib/* ${startdir}/pkg/opt/rubyee/lib/ruby/1.8/
  rm -rf ${startdir}/pkg/opt/rubyee/lib/ruby/1.8/lib
  
  cp -r ${startdir}/pkg/opt/rubyee/lib/ruby/1.8/bin ${startdir}/pkg/opt/rubyee/
  rm -rf ${startdir}/pkg/opt/rubyee/lib/ruby/1.8/bin
}
# vim:set ts=2 sw=2 et:

