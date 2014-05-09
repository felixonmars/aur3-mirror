# Maintainer: Commiebstrd<spenserreinhardt@gmail.com>
pkgname=barnyard2
pkgver=2
pkgrel=1.13
pkgdesc="A dedicated spooler for Snort's unified2 binary output format."
arch=('i686' 'x86_64')
url="http://www.securixlive.com/barnyard2/index.php"
license=('GPL2')
depends=('libmariadbclient' 'libpcap')
optdepends=("snort: IPS\IDS detection solution" "suricata: Multi-threaded IPS\IDS")
source=("https://github.com/firnsy/${pkgname}/archive/v${pkgver}-${pkgrel}.tar.gz")
md5sums=('212066058364f18a4806720b271ffd87')
sha256sums=('b9e67f22334b937a59cf808ca20bdcd9c46561a4369979c965a0bb554d7dd09b')

build() {

  # move to correct dir
  cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}"

  #autoconf, config, and make  
  ./autogen.sh
  ./configure --with-mysql --prefix=/usr --sysconfdir=/etc
  make

}

check() {

  cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}"

  # verify everything will work with whats installed
  make check

}

package() {

  cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}"

  make DESTDIR="${pkgdir}" install
  
  cd "${pkgdir}"
  mkdir "var/log/$pkgname" -p

  #file permission mods and creation of initial .waldo file
  touch "var/log/${pkgname}/${pkgname}.waldo"
  chmod 664 "var/log/${pkgname}/${pkgname}.waldo"
  chmod 664 "etc/${pkgname}.conf"
  chmod 554 "usr/bin/${pkgname}"

}
