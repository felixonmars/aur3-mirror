# Contributor: Matias De la Puente <mfpuente.ar@gmail.com>
pkgname=watray
pkgver=0.1.1
pkgrel=1
pkgdesc="General purpose IDE"
arch=('i686' 'x86_64')
url="http://code.google.com/p/watray/"
license=('LGPL')
depends=('glib2' 'gtk2' 'gconf' 'libgee')
makedepends=()
options=('!libtool')
source=(http://watray.googlecode.com/files/$pkgname-$pkgver.tar.bz2)
md5sums=('90887d3e5330a3cae25d62677501d60c')

build()
{
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

