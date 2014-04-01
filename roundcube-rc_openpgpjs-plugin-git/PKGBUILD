# Maintainer: rs0 <rs0@secretco.de.com>

_gitname="qnrq"
_pkgname="rc_openpgpjs"

pkgname=roundcube-${_pkgname}-plugin-git
pkgver=214.a4984bf
pkgrel=1
pkgdesc="Roundcube plugin that provides OpenPGPs functionality."
arch=('any')
url="https://github.com/${_gitname}/${_pkgname}"
license=('GPL2')
depends=('roundcubemail>=0.9.0')
makedepends=('git')
source=(git+https://github.com/${_gitname}/${_pkgname}.git)
md5sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  _instdir=${pkgdir}/usr/share/webapps/roundcubemail/plugins
  install -dm755 ${_instdir}
  rm -r ${srcdir}/${_pkgname}/.git
  cp -r ${srcdir}/${_pkgname} ${_instdir}

  # fix all the 644 perms on files
  find ${_instdir} -type f -exec chmod 644 {} \;
}
