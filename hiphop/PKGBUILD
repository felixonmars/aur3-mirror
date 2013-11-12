# Maintainer: numkem <numkem@gmail.com>
# Contributor: Spider.007 <archPackage@spider007.net>
pkgname=hiphop
pkgver=2.2.0
pkgrel=1
pkgdesc="Transforms PHP source code into highly optimized C++"
arch=(x86_64)
url="http://wiki.github.com/facebook/hiphop-php/"
license=('custom')
depends=('boost' 're2c' 'libmysqlclient' 'libxml2' 'libmcrypt' 'icu' 'openssl' 'libcap' 'gd' 'zlib' 'intel-tbb' 'php' 'oniguruma' 'pcre' 'expat' 'libevent-hphp' 'libmemcached' 'imap' 'libunwind' 'libdwarf' 'google-glog' 'curl')
makedepends=('git' 'cmake')
source=('http://github.com/facebook/hhvm/archive/HHVM-2.2.0.tar.gz' 'hphp.sh' 'gpisc.diff')
md5sums=('2e0298ab6adcf3b7521a38b57d6d7774'
         'df8d144ed3c1d00a4fe573fae9848eb6'
         'c2fc791ad4a46f51c2f8eb4fa2d67586')
options=(!strip)

pkgver() {
  cd $srcdir/hiphop-php
  # Use the tag of the last commit
  local ver="$(git describe --long)"
  echo ${ver//-/.}
}

build() {
  cd $srcdir/hhvm-HHVM-${pkgver}

  sed -i 's/<libdwarf.h>/<libdwarf\/libdwarf.h>/' hphp/runtime/vm/debug/dwarf.h

  patch -p0 < $srcdir/gpisc.diff
  rm -f $srcdir/hiphop-php/CMakeCache.txt

  export CMAKE_PREFIX_PATH=/opt/hiphop
  export HPHP_HOME=$srcdir/hhvm-HHVM-${pkgver}
  export HPHP_LIB=$HPHP_HOME/bin
  cmake . || return 1
  make || return 1
}

package() {
  mkdir -p $pkgdir/opt/hiphop/
  mv $srcdir/hhvm-HHVM-${pkgver}/ $pkgdir/opt/hiphop/hiphop-php
  cp -p $srcdir/hphp.sh $pkgdir/opt/hiphop/hphp.sh
}
