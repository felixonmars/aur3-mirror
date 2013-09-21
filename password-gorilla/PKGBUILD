# Contributor: brianbahr <brianbahr1 at gmail dot com>
# Maintainer: brianbahr <brianbahr1 at gmail dot com>
pkgname=password-gorilla
pkgver=1.5.3.7
pkgrel=1
pkgdesc="A cross-platform password manager."
arch=('i686' 'x86_64')
url="https://github.com/zdia/gorilla/wiki/"
license=('GPL2')
depends=()
options=(!strip)
_gorilla_startkit_i686=(gorilla1537.bin)
_gorilla_startkit_x86_64=(gorilla1537_64.bin)
[ "$CARCH" = "i686" ] && source=(http://www.zdia.de/downloads/gorilla/$_gorilla_startkit_i686)
[ "$CARCH" = "i686" ] && md5sums=('6a7b347ae0420a989f468e201396c4c2')
[ "$CARCH" = "x86_64" ] && source=(http://www.zdia.de/downloads/gorilla/$_gorilla_startkit_x86_64)
[ "$CARCH" = "x86_64" ] &&  md5sums=('f41395230978380820b8e2cc9bd5a708')

package() {
  mkdir -p ${pkgdir}/usr/bin/
  if [ "$CARCH" = "i686" ] ; then install -m 755 $_gorilla_startkit_i686 ${pkgdir}/usr/bin/ && ln -s /usr/bin/$_gorilla_startkit_i686 ${pkgdir}/usr/bin/gorilla
  fi
  if [ "$CARCH" = "x86_64" ] ; then install -m 755 $_gorilla_startkit_x86_64 ${pkgdir}/usr/bin/ && ln -s /usr/bin/$_gorilla_startkit_x86_64 ${pkgdir}/usr/bin/gorilla
  fi
}



