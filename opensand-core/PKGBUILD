# Maintainer: Audric Schiltknecht <storm+arch@chemicalstorm.org>
pkgname=opensand-core
pkgver=3.0.0
pkgrel=1
pkgdesc="The OpenSAND emulation testbed core"
arch=('i686' 'x86_64')
url="http://www.opensand.org"
license=('GPL3')
groups=('opensand')
depends=('opensand-conf' 'opensand-output' 'opensand-rt')
source=("https://launchpad.net/opensand/3.0.x/${pkgver}/+download/opensand-${pkgver}.tar.gz"
        'opensand-core.patch'
        'opensand-core-bridge.patch')
md5sums=('1e62f66c17397f778d58f79fb42b2564'
         '81d4f7818a48952551ecdc02abc77e97'
         '2e7ccda63aee79c2e5fc3b0ca9e53bf5')

prepare() {
  cd "$srcdir/opensand-$pkgver"
  tar xf $pkgname-$pkgver.tar.gz
  cd "$pkgname-$pkgver"
  patch -p1 < $srcdir/opensand-core.patch
  patch -p1 < $srcdir/opensand-core-bridge.patch
}

build() {
  cd "$srcdir/opensand-$pkgver/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/opensand-$pkgver/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/opensand-$pkgver/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # Copy configuration
  install -Dm644 "conf/xsd/common.xsd" "$pkgdir/usr/share/opensand/common.xsd"

  for component in sat st gw ; do \
    install -Dm644 "conf/core_${component}.conf" "$pkgdir/usr/share/opensand/$component/core.conf"
    install -Dm644 "conf/xsd/core_${component}.xsd" "$pkgdir/usr/share/opensand/$component/core.xsd"
    sed -i "s#schemaLocation=\".*\"#schemaLocation=\"/usr/share/opensand/common.xsd\"#g" "$pkgdir/usr/share/opensand/$component/core.xsd"
  done

  install -Dm644 conf/core_global.conf "$pkgdir/usr/share/opensand/core_global.conf"
  install -Dm644 conf/topology.conf "$pkgdir/usr/share/opensand/topology.conf"

  install -Dm644 conf/xsd/core_global.xsd "$pkgdir/usr/share/opensand/core_global.xsd"
  install -Dm644 conf/xsd/topology.xsd "$pkgdir/usr/share/opensand/topology.xsd"

  install -Dm644 conf/deploy.ini "$pkgdir/usr/share/opensand/deploy.ini"

  # Plugins
  install -Dm644 conf/mandatory_plugins/mandatory_plugins/attenuation.csv "$pkgdir/usr/share/opensand/plugins/attenuation.csv"
  install -Dm644 conf/mandatory_plugins/mandatory_plugins/constant.conf "$pkgdir/usr/share/opensand/sat/plugins/constant.conf"
  install -Dm644 conf/mandatory_plugins/mandatory_plugins/constant.xsd "$pkgdir/usr/share/opensand/sat/plugins/constant.xsd"
  install -Dm644 conf/mandatory_plugins/mandatory_plugins/mpeg.conf "$pkgdir/usr/share/opensand/plugins/mpeg.conf"
  install -Dm644 conf/mandatory_plugins/mandatory_plugins/mpeg.xsd "$pkgdir/usr/share/opensand/plugins/mpeg.xsd"
  for component in st gw ; do \
    mkdir -p "$pkgdir/usr/share/opensand/$component/plugins"
    for plugin in ip ideal on_off file triangular constant; do \
      install -Dm644 conf/mandatory_plugins/mandatory_plugins/${plugin}.* "$pkgdir/usr/share/opensand/${component}/plugins/"
    done
  done

  # Copy default configuration
  install -Dm644 conf/modcod/forward/forward/definition.txt "$pkgdir/etc/opensand/modcod/down_forward_def.txt"
  install -Dm644 conf/modcod/forward/forward/clear_sky.txt "$pkgdir/etc/opensand/modcod/down_forward_simu.txt"
  install -Dm644 conf/modcod/return/return/definition_MPEG.txt "$pkgdir/etc/opensand/modcod/up_return_def.txt"
  install -Dm644 conf/modcod/return/return/clear_sky.txt "$pkgdir/etc/opensand/modcod/up_return_simu.txt"
}

# vim:set ts=2 sw=2 et:
