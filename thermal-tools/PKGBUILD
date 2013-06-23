# Maintainer: Kalrish Bäakjen <kalrish.antrax@gmail.com>

pkgname='thermal-tools'
_gitname='thermal-tools'
pkgver=0.0
pkgrel=1
pkgdesc="A set of scripts to help monitoring the system temperature"
arch=('any')
url='https://github.com/Kalrish/thermal-tools'
license=('GPL')
depends=('bash' 'coreutils')
optdepends=('sudo: support for writing of sysfs attributes as a normal user')
makedepends=('git')
source=('git://github.com/Kalrish/thermal-tools.git')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --always | sed 's|-|.|g'
}

package() {
	cd "$_gitname"
	
	mkdir -p "${pkgdir}/usr/bin"
	
	for P in *.sh
	do
		install "$P" "${pkgdir}/usr/bin/$(basename "$P" .sh)"
	done
}
