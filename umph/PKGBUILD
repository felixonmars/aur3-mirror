# Maintainer: kfgz <kfgz at interia dot pl>
# Contributor: Farhad Shahbazi <farhad at enthusiasm dot cc>

pkgname=umph
pkgver=0.2.5
pkgrel=1
pkgdesc="Command line tool for parsing Youtube playlists. It prints playlist video links."
arch=('any')
url="http://code.google.com/p/umph/"
license=('GPL3')
depends=('perl-xml-dom' 'perl-getopt-argvfile')
optdepends=('perl-umph-prompt: for interactive prompt')
source=("http://umph.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
sha1sums=('f333ed13e4bf4ce59fd745f8b4c8bedae4e6c2e7')

package() {
  cd "${srcdir}"
  install -D -m755 ${pkgname}-${pkgver}/bin/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
  pod2man ${pkgname}-${pkgver}/doc/man1/umph.1.pod > ${pkgname}-${pkgver}/doc/man1/umph.1
  install -D -m644 ${pkgname}-${pkgver}/doc/man1/umph.1 "${pkgdir}"/usr/share/man/man1/umph.1
}
