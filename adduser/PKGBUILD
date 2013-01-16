# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=adduser
pkgver=1.15
pkgrel=2
pkgdesc="Interactive front end to /usr/sbin/useradd from Slackware Linux (patched for consistent defaults)"
arch=('any')
url="http://www.slackware.com/"
license=('BSD')
provides=('adduser')
depends=('gawk' 'shadow>=4.1.5.1-3')
source=("http://mirrors.slackware.com/slackware/slackware64-current/source/a/shadow/adduser"
        "defaults.patch")
md5sums=('84514d199d0fce7ad2c2f439ec7a7bea'
         'b5f01207b021060cc45f7cc8a9e721d3')

package() {
  install -D -m755 adduser "${pkgdir}/usr/sbin/adduser"
  sed '/^###/q;1,2d;s/^# *//' adduser | head -n -2 > LICENSE
  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${pkgdir}"
  patch -Np1 -i ../defaults.patch
}

# vim:set ts=2 sw=2 et:
