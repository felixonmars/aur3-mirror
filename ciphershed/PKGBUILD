# $Id$
# Maintainer: stef312 <stef312_at_gmail_dot_com>

pkgname=ciphershed
pkgver=7.1a
pkgrel=2
pkgdesc="CipherShed is free (as in free-of-charge and free-speech) encryption software for keeping your data secure and private. It started as a fork of the now-discontinued TrueCrypt Project."
url="https://ciphershed.org/"
arch=('i686' 'x86_64')
license=('custom') # TrueCrypt License Version 3.0
depends=('fuse>=2.8.0' 'wxgtk2.8>=2.8.9' 'libsm' 'device-mapper')
makedepends=('nasm' 'git')
optdepends=('sudo: mounting encrypted volumes as nonroot users')
conflicts=('truecrypt' 'truecrypt-utils')
replaces=('truecrypt' 'truecrypt-utils')
source=("${pkgname}.desktop")
md5sums=("7e8496527367b1c31b5be73a4de58746")
_gitroot="https://github.com/CipherShed/CipherShed.git"
_gitname="CipherShed"
_gitcommit="e8529e95d89d3f519a31ef7de5bd7f0d0d318e8c"

build() {
  if [[ -d ${_gitname} ]] ; then
    cd ${_gitname}
    git pull origin
  else
    git clone $_gitroot || return 1
    cd ${_gitname}
  fi
  
  git reset --hard "${_gitcommit}"
  
  cd src/
  WX_CONFIG=/usr/bin/wx-config-2.8 LIBS="-ldl" make
}

package() {
  cd ${_gitname}/src
  
  # Biary
  install -D -m755 Main/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  
  # Resources
   # Install Desktop file and Icon
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 Resources/Icons/CipherShed-48x48.xpm "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"
}
 
