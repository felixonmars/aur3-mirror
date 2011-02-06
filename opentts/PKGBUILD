# maintainer: Steve Holmes <steve.holmes88@gmail.com>
# Contributor: Chris Brannon <cmbrannon@cox.net>

pkgname=opentts
pkgver=0.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="High-level device independent layer for speech synthesis interface"
license=('GPL2' 'FDL')
depends=('glib2' 'alsa-lib' 'python' 'dotconf')
optdepends=('festival-freebsoft-utils: Speech output using Festival.' \
            'flite: Speech output using Festival lite.' \
            'espeak: Speech output using ESpeak.')
makedepends=('pkgconfig' 'espeak' 'dotconf' 'automake')
provides=("opentts=$pkgver")
options=('!libtool') 
url="http://www.opentts.org/projects/opentts"

source=("http://files.opentts.org/opentts/$pkgname-$pkgver.tar.gz" \
        "openttsd.sh")

md5sums=('2e737f5059f96e02f9e2936a4cf2acba'
         'd26699d15c5a59d7be10c7c16934e3fc')

install="opentts.install"

backup=(etc/opentts/openttsd.conf \
        etc/opentts/clients/*.conf \
	etc/opentts/modules/*.conf)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --with-alsa --with-libao || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  rm -f ${pkgdir}/usr/share/info/dir
  gzip -9nf ${pkgdir}/usr/share/info/*
  install -D -m755 ${srcdir}/openttsd.sh ${pkgdir}/etc/rc.d/openttsd
  mkdir -p ${pkgdir}/var/log/opentts
}
