# $Id: PKGBUILD 162994 2012-07-04 21:45:33Z dreisner $
# Maintainer: Nicky726 <nicky726@gmail.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>

pkgname=selinux-pambase
_origname=pambase
pkgver=20130113
pkgrel=1
pkgdesc="SELinux aware base PAM configuration for services"
arch=('any')
url="http://www.archlinux.org"
license=('GPL')
groups=('selinux' 'selinux-system-utilities')
conflicts=("${_origname}")
provides=("${_origname}=${pkgver}-${pkgrel}")
source=('system-auth'
        'system-local-login'
        'system-login'
        'system-remote-login'
        'system-services'
        'other')
backup=('etc/pam.d/system-auth'
        'etc/pam.d/system-local-login'
        'etc/pam.d/system-login'
        'etc/pam.d/system-remote-login'
        'etc/pam.d/system-services'
        'etc/pam.d/other')
md5sums=('5f169a4ffe7ed69f58e106cdd2d760df'
         '477237985820117a0e6e1b13a86eb599'
         '9619580c5a49272fa58f137828dfc67d'
         '477237985820117a0e6e1b13a86eb599'
         '30fe7d41e054ee43fab7855bf88a07e5'
         '6e6c8719e5989d976a14610f340bd33a')

package() {
  install -dm755 "$pkgdir/etc/pam.d"
  install -m644 -t "$pkgdir/etc/pam.d" "${source[@]}"
}

# vim:set ts=2 sw=2 et:
