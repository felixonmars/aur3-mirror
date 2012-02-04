# Maintainer: dryes <joswiseman@gmail>
# Contributor: Corrado Primier <ilbardo gmail com>
# Contributor: Other contributors existed but lost information
# Contributor: dpevp <daniel.plaza.espi@gmail.com>
# Contributor: jordi Cerdan (jcerdan) <jcerdan@tecob.com>
pkgname='pommed-git'
pkgver=20120107
pkgrel=1
pkgdesc='Handles the hotkeys of Apple MacBook (Pro) laptops.'
url='http://technologeek.org/projects/pommed'
arch=('i686' 'x86_64')
license=('GPL2')
install='pommed.install'
depends=('alsa-lib' 'audiofile' 'confuse' 'dbus-core' 'pciutils')
optdepends=('eject')
provides=('pommed')
conflicts=('pommed')
makedepends=('git')
source=('pommed.rc')
md5sums=('c024728673d20aef3a9d8dff3fc5b388')

_gitroot='git://git.debian.org/git/pommed/pommed.git'
_gitname='pommed'

build() {
  cd "${srcdir}"
  msg 'Connecting to GIT server....'

  if [ -d "${_gitname}" ] ; then
    cd "${_gitname}" && git pull origin
    msg 'The local files are updated.'
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg 'GIT checkout done or server timeout'
  
  cd "${srcdir}/${_gitname}"
  make pommed
}

package() {
  install -Dm755 "${srcdir}/${_gitname}/pommed/pommed" "${pkgdir}/usr/sbin/pommed"
  install -Dm644 "${srcdir}/${_gitname}/pommed.conf.mactel" "${pkgdir}/etc/pommed.conf.mactel"
  install -Dm644 "${srcdir}/${_gitname}/pommed.conf.pmac" "${pkgdir}/etc/pommed.conf.pmac"
  install -Dm755 "${srcdir}/pommed.rc" "${pkgdir}/etc/rc.d/pommed"
  install -Dm644 "${srcdir}/${_gitname}/dbus-policy.conf" "${pkgdir}/etc/dbus-1/system.d/pommed.conf"

  # Man page
  install -Dm644 "${srcdir}/${_gitname}/pommed.1" "${pkgdir}/usr/share/man/man1/pommed.1"

  # Sounds
  install -Dm644 "${srcdir}/${_gitname}/pommed/data/goutte.wav" "${pkgdir}/usr/share/pommed/goutte.wav"
  install -Dm644 "${srcdir}/${_gitname}/pommed/data/click.wav" "${pkgdir}/usr/share/pommed/click.wav"
}
