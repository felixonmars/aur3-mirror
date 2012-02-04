#Contributor: Marcelo Cavalcante - kalib <kalib@archlinux-br.org>
#Contributor: Kessia Pinheiro - even <kessiapinheiro@gmail.com>

pkgname=gespeak
pkgver=0.3
pkgrel=1
pkgdesc="An espeak front-end written in Python with GTK2"
arch=('i686')
depends=('espeak')
license=('GPL3')
url="http://code.google.com/p/gespeak/"
source=("http://gespeak.googlecode.com/files/gespeak_${pkgver}.${pkgrel}_any.tar.gz")
md5sum=('bb2327bb2cf8d8a2df74abeda8aef08f')

build() {
  cd "${srcdir}/any"

  mkdir -p ${pkgdir}/usr/{bin/,share/{applications,gespeak,icons}}
  install -D -m0755 bin/gespeak ${pkgdir}/usr/bin/ || return 1
  install -D -m0644 share/applications/gespeak.desktop ${pkgdir}/usr/share/applications/ || return 1
  cp -r share/gespeak ${pkgdir}/usr/share || return 1
  install -D -m0644 share/icons/gespeak.png ${pkgdir}/usr/share/icons/ || return 1
  echo "GeSpeak Installed!"
}
