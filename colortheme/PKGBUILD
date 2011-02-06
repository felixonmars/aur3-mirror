# Maintainer:  Lucky <aur.archlinux.org [at] lucky.take0ver [dot] net>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>

pkgname=colortheme
pkgver=20100705
pkgrel=1
pkgdesc="script to show Your terminal color scheme, unicode and ascii version"
url="http://bbs.archlinux.org/viewtopic.php?id=59253"
arch=("any")
license=("GPL")
source=("${pkgname}"
        "${pkgname}-ascii"
        "${pkgname}.patch")
md5sums=("e2fad9e125d20ddb6a56e8f2c4033d3d"
         "6a289d4bbfce1035a180c559165e6d95"
         "8d9da9af49196e67638bb269128d984e")

build() {
  cd "${srcdir}"

  mv "${pkgname}" "${pkgname}-unicode"
  cat "${pkgname}-ascii" >> "${pkgname}"
  cat "${pkgname}-unicode" >> "${pkgname}"
  patch -uNp1 -i "${srcdir}/${pkgname}.patch"

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
