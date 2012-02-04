# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
pkgname=gedit-dash-bzr
pkgver=9
pkgrel=1
pkgdesc="Gedit dash plugin with Zeitgeist support"
arch=('i686' 'x86_64')
url="http://seilo.geekyogre.com/2011/11/gedit-dash-0-1/"
license=('GPL')
depends=('gedit' 'zeitgeist')
makedepends=('bzr')
provides=('gedit-dash')
conflicts=('gedit-dash')
source=()
sha512sums=()

_bzrtrunk="lp:~seif/gedit/dash"
_bzrmod=gedit-dash

build() {
  cd "${srcdir}"
  msg "Connecting to Bazaar server...."

  if [[ -d "${_bzrmod}" ]]; then
    cd "${_bzrmod}" && bzr pull "${_bzrtrunk}" -r "${pkgver}"
    msg "The local files are updated."
  else
    bzr branch "${_bzrtrunk}" "${_bzrmod}" -q -r "${pkgver}"
  fi

  msg "Bazaar checkout done or server timeout"
  msg "Nothing to build."
}

package() {
  cd "${srcdir}/${_bzrmod}"
  install -dm755 "${pkgdir}/usr/lib/gedit/plugins/"
  install -m644 'dashboard.plugin' "${pkgdir}/usr/lib/gedit/plugins/"
  install -m644 'dashboard.py' "${pkgdir}/usr/lib/gedit/plugins/"
}

# vim:set ts=2 sw=2 et:
