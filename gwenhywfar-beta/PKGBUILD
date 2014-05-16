# Maintainer: Sebastian Lenz <quizzmaster@gmail.com>

pkgname=gwenhywfar-beta
pkgver=4.12.0beta
_dnrel=76
pkgrel=1
pkgdesc="OS abstraction functions for various projects"
arch=(i686 x86_64)
url="http://www.aquamaniac.de"
license=("LGPL")
depends=('openssl' 'gnutls' 'libgcrypt')
makedepends=('gtk2' 'qt4')
optdepends=('gtk2' 'qt4')
provides=('gwenhywfar')
conflicts=('gwenhywfar')
source=("gwenhywfar-$pkgver.tar.gz::http://www.aquamaniac.de/sites/download/download.php?package=01&release=${_dnrel}&file=01&dummy=gwenhywfar-$pkgver.tar.gz")
md5sums=('c3080d30685ea91e026583eb814cc063')

build() {
	    cd $srcdir/gwenhywfar-$pkgver
		  ./configure --prefix=/usr --sysconfdir=/etc --enable-ssl
		    sed -i 's|gnutls_transport_set_lowat||g' src/sio/syncio_tls.c
			  make
		  }

		  package() {
			    cd $srcdir/gwenhywfar-$pkgver
				  make DESTDIR=$pkgdir install
			  }
