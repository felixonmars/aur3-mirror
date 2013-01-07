# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=opensc-dnie-svn
pkgver=236
pkgrel=1
pkgdesc='Access smart cards that support cryptographic operations. with D.G.P official DNIe driver. (SVN version)'
arch=('i686' 'x86_64')
url="http://www.opensc-project.org/opensc"
license=("custom:DGP")
backup=(etc/opensc.conf)
depends=('pinentry' 'ccid' 'libassuan')
makedepends=('nasm' 'subversion' 'docbook-xsl')
provides=('opensc')
conflicts=('opensc')
options=('!emptydirs' '!libtool')

_svntrunk="https://forja.cenatic.es/svn/opendnie/opensc-dnie/trunk/"
_svnmod="opensc-dnie"

build() {
  cd "${srcdir}"

  msg "Connecting to SVN server...."

  if [ -d "${_svnmod}" ]; then
      cd "${_svnmod}" && svn update
  else
      svn co "${_svntrunk}" "${_svnmod}"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -fr "${srcdir}/${_svnmod}-build"
  cp -R "${srcdir}/${_svnmod}" "${srcdir}/${_svnmod}-build"
  cd "${srcdir}/${_svnmod}-build"

  ./bootstrap
  _sheetdir=(/usr/share/xml/docbook/xsl-stylesheets-*)
  ./configure --prefix=/usr --enable-openssl --enable-readline --enable-man --enable-pcsc --enable-zlib --enable-doc --sysconfdir=/etc --with-xsl-stylesheetsdir="${_sheetdir}"
  make
}

package() {
  cd "${srcdir}/${_svnmod}-build"
  install -d "${pkgdir}"/{etc,usr/lib/pkcs11}
  make DESTDIR="${pkgdir}" install
}
