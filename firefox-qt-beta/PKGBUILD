#Maintainer: NonnaPapera <openpussies@Gmail.com>

pkgname=firefox-qt-beta
pkgver=3.5b4
pkgrel=1
pkgdesc="Beta 4 of Firefox 3.5"
arch=('i686' 'x86_64')
url="http://www.mozilla.org/"
license=('MPL')
groups=('internet')
makedepends=('zip')
source=(http://releases.mozilla.org/pub/mozilla.org/firefox/releases/3.5b4/source/firefox-3.5b4-source.tar.bz2)

build() {
  cd $srcdir/mozilla-1.9.1
  ./configure --prefix=/opt/firefox-qt --disable-windows-mobile-components --with-x --disable-os2-high-mem --enable-application=browser --enable-default-toolkit=cairo-qt --enable-official-branding --disable-printing --enable-native-uconv --disable-xpcom-obsolete --disable-inspector-apis --disable-parental-controls --disable-vista-sdk-requirements
  make || return 1
  make prefix=$pkgdir/opt/firefox-qt install
}
