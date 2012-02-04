# Maintainer: Madek <gonzaloseguel@gmail.com>

pkgname=python-appindicator
realname=indicator-application
pkgver=0.2.9
pkgrel=1
pkgdesc="Python bindings for indicator-application. (Canonical Ayatana Project)"
arch=('i686' 'x86_64')
url="https://launchpad.net/indicator-application"
license=('GPL')
depends=('indicator-application' 'python2')
source=(http://archive.ubuntu.com/ubuntu/pool/main/i/indicator-application/indicator-application_${pkgver}.orig.tar.gz
	fix-python-bindings.patch
	configure.ac
	Makefile)
md5sums=('e63c8f0570d9debadea0f8d86c33c258'
         'c6d0aec57b53c6cac0a953b582572b94'
	 '9ddba4af0f66e3a560f2d3cc08fee4eb'
	 'cc6d461668ea44efd91d27d014a46b81')

build() {
  cd ${srcdir}/${realname}-${pkgver}
  patch -Np1 -i $srcdir/fix-python-bindings.patch || return 1
  cp -r ${srcdir}/configure.ac configure.ac
  ./autogen.sh --prefix=/usr --disable-static --enable-introspection=no || return 1
  cp -r ${srcdir}/Makefile bindings/Makefile
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
#cleaning up
cd ${pkgdir}/usr
rm -r include
rm -r lib/indicators
rm -r lib/pkgconfig
rm -r lib/libappindicator.la
rm -r lib/libappindicator.so
rm -r lib/libappindicator.so.1
rm -r lib/libappindicator.so.1.0.0
rm -r libexec
rm -r share/dbus-1
rm -r share/indicator-application
}
