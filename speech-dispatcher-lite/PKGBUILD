# $Id: PKGBUILD 179645 2013-03-09 01:49:56Z eric $
# Maintainer:
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Steve Holmes <steve.holmes88@gmail.com>
# Contributor: Alexander Jenisch <nt@divzero.at>
# Contributor: Chris Brannon <cmbrannon@cox.net>
# Contributor: Andreas Messer <andi@bupfen.de>

pkgname=speech-dispatcher-lite
_pkgname=speech-dispatcher
pkgver=0.8
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="High-level device independent layer for speech synthesis interface without python"
url="http://www.freebsoft.org/speechd"
license=('GPL2' 'FDL')
depends=('glib2' 'libltdl' 'dotconf' 'libpulse')
makedepends=('intltool')
optdepends=('festival: Speech output using Festival'
        'espeak: Speech output using ESpeak'
        'pulseaudio: PulseAudio support')
provides=("speechd=${pkgver}" "$_pkgname")
conflicts=("$_pkgname")
options=('!libtool') 
backup=(etc/speech-dispatcher/clients/gnome-speech.conf
	etc/speech-dispatcher/clients/emacs.conf
	etc/speech-dispatcher/modules/ibmtts.conf
	etc/speech-dispatcher/modules/espeak-generic.conf
	etc/speech-dispatcher/modules/espeak.conf
	etc/speech-dispatcher/modules/swift-generic.conf
	etc/speech-dispatcher/modules/festival.conf
	etc/speech-dispatcher/modules/cicero.conf
	etc/speech-dispatcher/modules/espeak-mbrola-generic.conf
	etc/speech-dispatcher/modules/dtk-generic.conf
	etc/speech-dispatcher/modules/llia_phon-generic.conf
	etc/speech-dispatcher/modules/ivona.conf
	etc/speech-dispatcher/modules/epos-generic.conf
	etc/speech-dispatcher/modules/flite.conf
	etc/speech-dispatcher/speechd.conf)
install="${_pkgname}.install"
source=("http://www.freebsoft.org/pub/projects/speechd/$_pkgname-$pkgver.tar.gz"
        'speech-dispatcherd.service')
md5sums=('d88691a64c676122f996230c107c392f'
         'd26f52e2e95a30eaa83560f0e63faca5')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --disable-static \
    --disable-python \
    --without-espeak \
    --without-flite \
    --without-ibmtts \
    --without-ivona \
    --without-pico \
    --without-pulse \
    --without-libao \
    --without-oss \
    --without-nas     
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}"/speech-dispatcherd.service "${pkgdir}/usr/lib/systemd/system/speech-dispatcherd.service"
  install -d "${pkgdir}/var/log/speech-dispatcher"
}
