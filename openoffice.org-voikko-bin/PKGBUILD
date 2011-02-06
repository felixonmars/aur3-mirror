# Contributor: Jesse Jaara <jesse.jaara@gmail.com>
pkgname=openoffice.org-voikko-bin
pkgver=3.1.1
ubuild_ver=1
pkgrel=1
pkgdesc="Ubuntus binary package! Finnish spellchecker, grammar checker and hyphenator extension for OpenOffice.org"
arch=('i686' 'x86_64')
url="http://voikko.sourceforge.net"
license=('GPL3')
depends=('libvoikko')
provides=('openoffice-voikko')
conflicts=('openoffice-voikko')
replaces=('openoffice-voikko')
install=openoffice.org-voikko.install

if [ "$CARCH" = "x86_64" ]; then
    _arch=amd64
else
    _arch=i386
fi

# Check if we have go-openoffice

if [ -d /usr/lib/go-openoffice ]; then
  _ooo_ver=go-openoffice
else
  _ooo_ver=openoffice
fi

source=("http://se.archive.ubuntu.com/ubuntu/pool/main/o/openoffice.org-voikko/openoffice.org-voikko_${pkgver}-${ubuild_ver}_${_arch}.deb")

if [ "$CARCH" = "x86_64" ]; then
md5sums=('5d70ee2eb429d675036b12a1b178e5a5')
else
md5sums=('7f2f40219871ddb007ba88a6d5ad189c')
fi

build() {
  ar -x openoffice.org-voikko_${pkgver}-${ubuild_ver}_${_arch}.deb data.tar.gz
  tar xzf data.tar.gz

  cd ${srcdir}/usr/lib/openoffice/share/extension/install
  mkdir -p $pkgdir/usr/lib/${_ooo_ver}/share/extension/install
  cp voikko.oxt $pkgdir/usr/lib/${_ooo_ver}/share/extension/install/
}
# vim:set ts=2 sw=2 et:
