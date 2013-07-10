# Maintainer: achterin

pkgname=roundcube-rcguard-plugin-git
_gitname=rcguard
pkgver=47.baadec2
pkgrel=1
pkgdesc="Roundcube plugin that enforces reCAPTCHA for users that have too many failed logins"
arch=('any')
url="https://github.com/dennylin93/rcguard"
license=('BSD')
depends=('roundcubemail>=0.9.0')
makedepends=('git')
optdepends=('mysql'
            'sqlite'
            'postgresql')
source=(git+https://github.com/dennylin93/rcguard.git)
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  _instdir=${pkgdir}/usr/share/webapps/roundcubemail/plugins
  install -dm755 ${_instdir}
  rm -r ${srcdir}/rcguard/.git
  cp -r ${srcdir}/rcguard ${_instdir}

  # fix all the 644 perms on files
  find ${_instdir} -type f -exec chmod 644 {} \;
}
