# Contributor: Graziano Giuliani <graziano.giuliani@poste.it>
# Maintainer: Pierre Bourdon <delroth@gmail.com>
# Contributor: Michael Eckert <michael.eckert@linuxmail.org>

pkgname=pwauth
pkgver=2.3.11
pkgrel=2
pkgdesc="An authenticator designed to be used for web authentication"
arch=( 'i686' 'x86_64' )
url="http://code.google.com/p/pwauth/"
license=("BSD")
install='pwauth.install'
source=(http://pwauth.googlecode.com/files/$pkgname-$pkgver.tar.gz
        'uid-undefined-for-group.patch'
        'pwauth.install')

md5sums=('2b7812724653bb0d238c1e0dfd5affdf'
         '57af1eff1effdcd2bd191a0b27f0cbed'
         'd8ebe1d0efffdfbf375155072a5b215a')

build() {
  pwd
  cd ${srcdir}/${pkgname}-${pkgver}
  pwd
  patch -Np0 -i ../uid-undefined-for-group.patch
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -D -m755 pwauth ${pkgdir}/usr/bin/pwauth
  chmod +s ${pkgdir}/usr/bin/pwauth
}

# vim:set ts=2 sw=2 et:
