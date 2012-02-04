# Contributor: Adam Griffiths <adam_griffithsAATTdart.net.au>
# Contributor: Nick B <Shirakawasuna at gmail dot com>

pkgname=ode-dp
pkgver=0.11.1
pkgrel=1
pkgdesc="An open source, high performance library for simulating rigid body dynamics.  Double precision version for mu-cade."
arch=('i686' 'x86_64')
url="http://www.ode.org"
license=('LGPL' 'BSD')
depends=('gcc-libs' 'bash')
source=(http://downloads.sourceforge.net/sourceforge/opende/ode-${pkgver}.tar.bz2)
conflicts=('ode')
options=('!libtool')

build() {
  cd "${srcdir}/ode-${pkgver}"
  ./configure --prefix=/usr \
              --enable-shared \
			  --enable-double-precision
  make || return 1
  make DESTDIR=${pkgdir}/ install

  install -Dm0644 ${srcdir}/ode-${pkgver}/ou/LICENSE-BSD.TXT \
 		  ${pkgdir}/usr/share/licenses/ode/LICENSE-BSD.TXT
}
md5sums=('712579afabc2a15aa56e399f76171477')
