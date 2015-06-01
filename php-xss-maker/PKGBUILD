# Maintainer: Andrew Krasichkov <buglloc _ at _ yandex _ dot _ru>

pkgname=php-xss-maker
pkgver=0.1.3
pkgrel=1
pkgdesc="PHP extension for emulate a stored XSS"
arch=('i686' 'x86_64')
url="https://github.com/buglloc/php-xss-maker"
license=('PHP')
depends=('php')
conflicts=("php-xss-maker-git")
backup=('etc/php/conf.d/xss_maker.ini')
source=("https://github.com/buglloc/php-xss-maker/archive/v${pkgver}.tar.gz")
sha256sums=("9a78e70ead8568f0db3af447734343448ff2c96343d4ef8ace91f976d8504826")


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make INSTALL_ROOT="${pkgdir}" install
  echo "extension=xss_maker.so" > "xss_maker.ini"
  echo "xssmaker.autostart = Off" >> "xss_maker.ini"
  echo "xssmaker.use_autostart_trigger = On" >> "xss_maker.ini"
  install -D -m644 "xss_maker.ini" "${pkgdir}/etc/php/conf.d/xss_maker.ini"
}
