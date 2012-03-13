# Maintainer: Corey Mwamba <contact [dot] me [at] coreymwamba [dot] uk>
# Submitter:  Corey Mwamba <contact [dot] me [at] coreymwamba [dot] uk>
pkgname=daoism 
pkgver=0.4.3
pkgrel=1
pkgdesc="A simple GUI for making audio CDs from WAV files."

url="http://daoism.sourceforge.net"

arch=('i686')

license=('GPL')

depends=('libsndfile' 'gtk2' 'cdrdao')

optdepends=( 'alsa-oss: to preview/hear the layout before burning')

makedepends=('automake' 'autoconf')

conflicts=()

replaces=()

backup=()

install='daoism.install'
source=("http://ignum.dl.sourceforge.net/project/daoism/daoism/0.4.3/daoism-0.4.3.tgz")
md5sums=('d10a9ae4951489dfeb4d997f10065a91')
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -e 's|AC_DEFINE_UNQUOTED(GETTEXT_PACKAGE,"$GETTEXT_PACKAGE")|AC_DEFINE([GETTEXT_PACKAGE],"daoism",daoism is a CD burning package)|g' -i configure.in
  sh autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
 install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
# vim:set ts=2 sw=2 et: