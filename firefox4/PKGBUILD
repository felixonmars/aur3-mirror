# $Id: PKGBUILD 90129 2010-09-08 10:38:46Z ibiru $
# Maintainer: Konstantin Shabanov <kes.eclipse@gmail.com>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=firefox4
pkgver=4.0.1
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
conflicts=('firefox' 'firefox-pgo')
provides=('firefox')
depends=('desktop-file-utils' 'startup-notification>=0.8' 'dbus-glib>=0.82')
makedepends=('zip' 'pkg-config' 'diffutils' 'libgnomeui>=2.24.1' 'python2' 'wireless_tools' 'yasm' 'ccache' 'autoconf2.13' 'cairo-tee' 'nss>=3.12.9')
install=firefox.install
url="http://www.mozilla.com/en-US/firefox/beta/"
source=(http://releases.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}/source/firefox-${pkgver}.source.tar.bz2
        mozconfig
        firefox.desktop
        firefox-safe.desktop)

md5sums=('9abda7d23151e97913c8555a64c13f34'
         'd257f4b05ddf668d85a6bd8acbe8df80'
         'ba96924ece1d77453e462429037a2ce5'
         '6f38a5899034b7786cb1f75ad42032b8')

build() {
  cd "${srcdir}/mozilla-2.0"

  cp "${srcdir}/mozconfig" .mozconfig

  export LDFLAGS="-Wl,-rpath,/usr/lib/firefox-4.0"
  make -f client.mk build


  if [ "$CARCH" = "x86_64" ]; then
    make DESTDIR="${pkgdir}" -C obj-x86_64-unknown-linux-gnu install
  else
    make DESTDIR="${pkgdir}" -C obj-i686-pc-linux-gnu install
  fi 

  install -m755 -d ${pkgdir}/usr/share/{applications,pixmaps}
  install -m644 ${srcdir}/mozilla-2.0/browser/branding/unofficial/default48.png ${pkgdir}/usr/share/pixmaps/firefox.png
  install -m644 ${srcdir}/firefox.desktop ${pkgdir}/usr/share/applications/
  install -m644 ${srcdir}/firefox-safe.desktop ${pkgdir}/usr/share/applications/
}
