# $Id: PKGBUILD 200011 2013-11-21 01:40:28Z allan $
# Maintainer: Aelius Saionji
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=irssi_256
_pkgname=irssi
pkgver=0.8.16rc1
_pkgver=0.8.16-rc1
pkgrel=8
pkgdesc="Modular text mode IRC client with Perl scripting"
arch=('i686' 'x86_64')
url="http://irssi.org/"
license=('GPL')
depends=('glib2' 'openssl')
optdepends=('perl-libwww: for the scriptassist script')
conflicts=('irssi')
provides=('irssi')
backup=('etc/irssi.conf')
install=irssi_256.install
source=("http://irssi.org/files/${_pkgname}-${_pkgver}.tar.bz2"
	'06-add-print_text_after_time.diff'
	'07-no-split-utf8.diff'
	'256color.diff')
md5sums=('275c926dcbb11059f8685906df7cfe49'
	 'f92de48db3c88e997632663f2c9e7c88'
	 'a3bcc4ca6961c146408f08a80cafdfc5'
	 'a2963ec66acadd258920bba85ffd30ea')

prepare() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  patch -p1 < $srcdir/06-add-print_text_after_time.diff 
  patch -p1 < $srcdir/07-no-split-utf8.diff
  patch -p1 < $srcdir/256color.diff
}

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  ./configure --prefix=/usr \
              --enable-ipv6 \
	      --with-proxy \
	      --sysconfdir=/etc \
	      --with-perl-lib=vendor
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"

  make DESTDIR="${pkgdir}" install 
}
