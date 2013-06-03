# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=adduser-defaults
pkgver=1.15
pkgrel=6
pkgdesc="Interactive front end to /usr/bin/useradd from Slackware Linux (patched for consistent defaults)"
arch=('any')
url="http://www.slackware.com/"
license=('BSD')
provides=('adduser')
conflicts=('adduser')
depends=('gawk' 'shadow>=4.1.5.1-3')
source=("http://mirrors.slackware.com/slackware/slackware64-current/source/a/shadow/adduser"
        "defaults.patch")
md5sums=('84514d199d0fce7ad2c2f439ec7a7bea'
         '5b134cc7cf60d6c3f33c37f36d3ddeea')

package() {
  install -D -m755 adduser "${pkgdir}/usr/bin/adduser"
  sed '/^###/q;1,2d;s/^# *//' adduser | head -n -2 > LICENSE
  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${pkgdir}"
  patch -Np1 -i ../../defaults.patch
}

# vim:set ts=2 sw=2 et:
