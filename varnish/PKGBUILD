# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Douglas Soares de Andrade
# Contributor: Roberto Alsina <ralsina@kde.org>

pkgname=varnish
pkgver=3.0.0
pkgrel=1
pkgdesc="High-performance  HTTP accelerator"
arch=('i686' 'x86_64')
url="http://www.varnish-cache.org/"
license=('BSD')
depends=('ncurses' 'pcre')
backup=('etc/varnish.conf')
install=$pkgname.install
options=('!libtool')
source=(http://repo.varnish-cache.org/source/$pkgname-$pkgver.tar.gz \
        $pkgname.conf \
        $pkgname.init \
        $pkgname.runit \
        $pkgname.log.runit)
sha256sums=('30c4c931a50eab8e78a39a776b85cbb4d242f9ddb707e04e7876fb29f3a8a5eb'
            '46701975e6d975966316b7d253ca6310544523a1ba57400441f538cb82e17962'
            'b28a1acc6ea272c50eca928166ed2f85e80182eec370c35e98c955dc1bd4deca'
            '0bcbe89585fc5c83fa4a47fbe7d62443e2c3a97aa7bf9df10a1bc59e78060cbf'
            '18318e89528f70292c703340c9e209d96edbe8c36cb9c59fe1fa08c48d9fc7dd')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver

  make DESTDIR=${pkgdir} install

  install -d ${pkgdir}/var/$pkgname/$(hostname)
  install -D -m755 ${srcdir}/$pkgname.init ${pkgdir}/etc/rc.d/$pkgname
  install -D -m755 ${srcdir}/$pkgname.runit ${pkgdir}/etc/sv/$pkgname/run
  install -D -m755 ${srcdir}/$pkgname.log.runit ${pkgdir}/etc/sv/$pkgname/log/run
  install -D -m755 ${srcdir}/$pkgname.conf ${pkgdir}/etc/$pkgname.conf

#license
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}
