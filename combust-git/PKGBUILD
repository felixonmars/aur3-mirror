# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=combust-git
_gitname=combust
pkgver=0.15.becf95f
pkgrel=1
pkgdesc='Firewall/iptables script with profiles'
arch=('any')
license=('MIT')
url='https://github.com/gavinhungry/combust'
depends=('iptables')
source=("${_gitname}::git+https://github.com/gavinhungry/${_gitname}.git#branch=master")
md5sums=('SKIP')

pkgver () {
  cd "${srcdir}/${_gitname}"
  echo "0.$(git rev-list --count HEAD).$(git describe --always | sed 's|-|.|g')"
}

package() {
  cd "${srcdir}/${_gitname}"

  install -d $pkgdir/etc/iptables/
  install -d $pkgdir/usr/lib/systemd/system/
  install -m755 combust.sh "${pkgdir}"/etc/iptables/
  install -m600 combust.conf "${pkgdir}"/etc/iptables/
  install -m644 combust.service "${pkgdir}"/usr/lib/systemd/system/
}
