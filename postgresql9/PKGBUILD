# Maintainer: Journeyman <journeyman at kernel-panic dot dnsdojo dot net>
# i686 binary can be found at the kernel-panic arch repo

pkgname=postgresql9
pkgver=9.0.5
pkgrel=1
pkgdesc="A sophisticated object-relational DBMS"
arch=('i686' 'x86_64')
url="http://www.postgresql.org/"
license=('BSD')
depends=('libxml2' 'readline' 'heimdal' 'openssl' 'pam' 'libldap')
optdepends=('tcl: for PL/Tcl' 
            'perl: for PL/Perl'
            'python2: for PL/Python')
makedepends=('intltool' 'perl' 'python' 'tcl' 'libxslt')
conflicts=('postgresql' 'postgresql-libs')
options=('!libtool')
source=(http://wwwmaster.postgresql.org/redir/376/h/source/v${pkgver}/${pkgname/9/}-${pkgver}.tar.bz2)
md5sums=('86816eb8a8513532957b96045abdfef9')

build() {
  cd "${srcdir}/${pkgname/9/}-${pkgver}"
  ./configure --prefix=/usr \
	--with-perl \
	--with-python \
	--with-tcl \
	--with-ldap \
	--with-gssapi \
	--with-pam \
	--with-openssl \
	--with-libxml \
	--with-libxslt
  make || return 1
  make DESTDIR="${pkgdir}" install
}
