# Contributor: Jesus Jerez <jerezmoreno@gmail.com>
pkgname=gurlchecker
pkgver=0.13.1
pkgrel=1
pkgdesc="gURLChecker is a graphical web sites checker for GNU/Linux and other POSIX OS"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gnutls>=2.8' 'gtk2>=2.18' 'libgnomeui>=2.24' 'libglade>=2.6' 'libxml2>=2.7' 'gnet>=2.0' 'libcroco>=0.6' 'tidyhtml>=1.37' 'json-glib>=0.10' 'sqlite3>=3.6')
url="http://gurlchecker.labs.libre-entreprise.org/"
source=(http://labs.libre-entreprise.org/frs/download.php/857/${pkgname}-${pkgver}.tar.gz configure.patch general.h.patch)
md5sums=('f69ed4da0e257131290f2e6e59c09059'
		 '5fa444bea9093e71385b905eaeab3871'
		 'a8d6da37d35e017d572504bdc0ede6aa')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch configure ${startdir}/configure.patch
  patch src/general.h ${startdir}/general.h.patch
  ./configure --prefix=/usr/
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
