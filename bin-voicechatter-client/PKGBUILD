# Maintainer: Dan Serban
# Contributor: H.Gökhan Sarı <hsa2@difuzyon.net>

pkgname=bin-voicechatter-client
pkgver=1.4.6
pkgrel=1
pkgdesc="VoiceChatter is a free, cross-platform voice communication (chat) application."
arch=(i686)
url=http://voicechatter.org/
license=(GPL)
depends=(libjpeg6 libpng12)
source=("http://voicechatter.net/files/VoiceChatter-linux-${pkgver}.tar.gz")
md5sums=('4c5c4c00f3ed9ac82a097ed0ac8d2886')

build()
{
  rm *.tar.gz
  mkdir -p "${pkgdir}"/usr/share/voicechatter-client
  mv * "${pkgdir}"/usr/share/voicechatter-client/
  mkdir -p "${pkgdir}"/usr/bin
  USRBINFILE="${pkgdir}"/usr/bin/voicechatter-client
  echo '#!/bin/bash' > "${USRBINFILE}"
  echo '/usr/share/voicechatter-client/voicechatter' >> "${USRBINFILE}"
  chmod +x "${USRBINFILE}"
}
