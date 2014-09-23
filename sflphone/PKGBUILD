# Maintainer: Joris Engbers <info@jorisengbers.nl>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: Klaus Kurzmann <mok@mnet-online.de>
# Contributor: Maxime de Roucy <maxime.deroucy@gmail.com>
# Contributor: Maurizio Porrato <maurizio.porrato@gmail.com>

pkgname=sflphone
pkgver=1.4.1
pkgrel=1
pkgdesc="SIP/IAX2 compatible softphone"
arch=('i686' 'x86_64')
url="http://www.sflphone.org/"
license=('GPL3')
depends=('libpulse' 'gsm>=0.9.7' 'libzrtpcpp' 'log4c' 'check' 'libyaml' 'webkitgtk3' 'celt' 'dbus-c++' 'libnotify' 'speex' 'clutter-gtk')
makedepends=('autoconf' 'astyle' 'gnome-doc-utils' 'libgnomeui' 'yelp-tools' 'gnome-common' 'intltool')
optdepends=('sflphone-plugins: additional plugins')
source=("https://projects.savoirfairelinux.com/attachments/download/14805/${pkgname}-${pkgver}.tar.gz")
sha1sums=('8f77625c04763dab76df8933f935b60df8eb2777')
options=(!makeflags)
install=${pkgname}.install


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # PJSIP
  cd "${srcdir}/${pkgname}-${pkgver}/daemon/libs"
  ./compile_pjsip.sh

  # daemon
  cd "${srcdir}/${pkgname}-${pkgver}/daemon"

  ./autogen.sh
  ./configure --prefix=/usr --disable-ilbc --without-zrtp
  make

  # Gnome client
  cd "${srcdir}/${pkgname}-${pkgver}/gnome"
  ./autogen.sh
  ./configure --prefix=/usr --with-video
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/daemon"
  make DESTDIR="${pkgdir}" install
  mkdir "${pkgdir}/usr/lib/sflphone/audio"
  mv "${pkgdir}/usr/lib/sflphone/codecs/" "${pkgdir}/usr/lib/sflphone/audio/"

  cd "${srcdir}/${pkgname}-${pkgver}/gnome"
  make DESTDIR="${pkgdir}" install
}
