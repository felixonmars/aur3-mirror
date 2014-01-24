# Maintainer: Sirajul Muneer <siraj [dot] mussafirr [at] gmail [dot] com>
pkgname=newrelic-php
pkgver=4.4.5.35
pkgrel=5
pkgdesc="NewRelic PHP"
arch=('i686' 'x86_64')
url="http://newrelic.com/"
license=('non-free')
depends=(glibc php)
makedepends=(binutils)
checkdepends=()
optdepends=()
backup=('etc/php/conf.d/newrelic.ini.template')
install=newrelic-php.install

#source=("$pkgname$pkgrel"-"$pkgver"-"linux.tar.gz"
source=("https://download.newrelic.com/php_agent/release/$pkgname$pkgrel"-"$pkgver"-"linux.tar.gz"
"newrelic-daemon.service"
"newrelic-php.install")

md5sums=('d1cf7e2b032d1e75e9928561211da2b0'
         '3776bfc2d48df70a735b354025b91f46'
         '36d1af0bb81942597106f401b14c7329')
build() {
  cd "$srcdir/$pkgname$pkgrel-$pkgver-linux"
}

package() {
  cd "$srcdir/$pkgname$pkgrel-$pkgver-linux" 

  mkdir -p $pkgdir/usr/bin/ \
            $pkgdir/usr/lib/php/modules/ \
            $pkgdir/usr/share/doc/newrelic-php/ \
            $pkgdir/usr/lib/systemd/system/ \
            $pkgdir/etc/php/conf.d/;

  if [ $CARCH == i686 ]; then
    # Binary Daemon
    install -v -Dm755 ./daemon/newrelic-daemon.x86 $pkgdir/usr/bin/newrelic-daemon
    # PHP extension
    install -v -Dm755 ./agent/x86/newrelic-20121212-zts.so $pkgdir/usr/lib/php/modules/newrelic-20121212-zts.so
    install -v -Dm755 ./agent/x86/newrelic-20121212.so $pkgdir/usr/lib/php/modules/newrelic-20121212.so
  else
    # Binary Daemon
    install -v -Dm755 ./daemon/newrelic-daemon.x64 $pkgdir/usr/bin/newrelic-daemon
    # PHP extension
    install -v -Dm755 ./agent/x64/newrelic-20121212-zts.so $pkgdir/usr/lib/php/modules/newrelic-20121212-zts.so
    install -v -Dm755 ./agent/x64/newrelic-20121212.so $pkgdir/usr/lib/php/modules/newrelic-20121212.so
  fi

  install -v -Dm644 ./README ./LICENSE $pkgdir/usr/share/doc/newrelic-php/
  
  install -v -Dm644 ./scripts/newrelic.ini.template $pkgdir/etc/php/conf.d/newrelic.ini
  install -v -Dm644 ./scripts/newrelic.ini.template $pkgdir/etc/php/conf.d/newrelic.ini.template
  
  install -v -Dm644 ../newrelic-daemon.service $pkgdir/usr/lib/systemd/system/
}
