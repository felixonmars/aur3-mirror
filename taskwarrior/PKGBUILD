# Maintainer: Martin Lee <hellnest.fuah@gmail.com>

pkgname=taskwarrior
pkgdesc="Command-line TODO list manager"
_pkgsrc=task
pkgver=1.9.4
pkgrel=1
arch=('i686' 'x86_64')
url="http://taskwarrior.org/projects/show/taskwarrior"
license=('GPL2')
depends=('lua')
makedepends=('cmake')
source=(http://www.taskwarrior.org/download/${_pkgsrc}-${pkgver}.tar.gz)
sha256sums=('1020621c9bf885c3216a5c11cacced3c916b6495e0d09846b7438a152618d34a') 

build() {
  cd "${srcdir}/${_pkgsrc}-${pkgver}"
  
  cmake -DCMAKE_INSTALL_PREFIX=/usr

  make
  
}

package() {
  cd "${srcdir}/${_pkgsrc}-${pkgver}/src"
  install -Dm755 ${_pkgsrc} "${pkgdir}/bin/${_pkgsrc}"

  cd "${srcdir}/${_pkgsrc}-${pkgver}/scripts/bash"
  mkdir -p "${pkgdir}/etc/profile.d"
  install -Dm755 ${_pkgsrc}_completion.sh "${pkgdir}/etc/profile.d/"

  cd "${srcdir}/${_pkgsrc}-${pkgver}/doc/man"
  install -Dm644 $_pkgsrc.1 "${pkgdir}/usr/share/man/man1/$_pkgsrc.1"
  install -Dm644 $_pkgsrc-color.5 "${pkgdir}/usr/share/man/man5/$_pkgsrc-color.5"
  install -Dm644 $_pkgsrc-faq.5 "${pkgdir}/usr/share/man/man5/$_pkgsrc-faq.5"
  install -Dm644 taskrc.5 "${pkgdir}/usr/share/man/man5/taskrc.5"
  install -Dm644 $_pkgsrc-sync.5 "${pkgdir}/usr/share/man/man5/$_pkgsrc-sync.5"
  install -Dm644 $_pkgsrc-tutorial.5 "${pkgdir}/usr/share/man/man5/$_pkgsrc-tutorial.5"

  cd "${srcdir}/${_pkgsrc}-${pkgver}/doc/rc"
  mkdir -p "${pkgdir}/usr/share/${pkgname}/themes"
  install -Dm644 *.theme "${pkgdir}/usr/share/${pkgname}/themes/"
  install -Dm644 *.rc "${pkgdir}/usr/share/${pkgname}/"
}

