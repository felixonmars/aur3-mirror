# Contributer: Johannes Schöllhorn (atcq at atcq dot de)

pkgname=loudmouth-md5digest
pkgver=1.4.3
pkgrel=2
pkgdesc="loudmouth with md5-digest-uri.patch"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://developer.imendio.com/wiki/Loudmouth"
depends=('glib2>=2.18.3' 'gnutls>=2.6.3' 'libidn' )
conflicts=('loudmouth')
provides=('loudmouth')
options=('!libtool')
makedepends=('perlxml' 'pkgconfig' 'autoconf' 'automake')
source=("http://ftp.gnome.org/pub/gnome/sources/loudmouth/1.4/loudmouth-${pkgver}.tar.bz2" "01-fix-sasl-md5-digest-uri.patch" "02-gnutls-pkg-config.patch")
md5sums=('55339ca42494690c3942ee1465a96937' 'dc799cea18b24847b1e008c7424010a3' '2bc4c9bd4ee7cfd672c1d50c61cf0411')

build() {
    cd "${srcdir}/loudmouth-${pkgver}"

    patch -p1 -i ../../01-fix-sasl-md5-digest-uri.patch || return 1
    patch -p1 -i ../../02-gnutls-pkg-config.patch || return 1

    autoconf || return 1

    ./configure --prefix=/usr \
    		--disable-debug \
                --disable-static || return 1
    make || return 1
    make DESTDIR="${pkgdir}" install || return 1
}
