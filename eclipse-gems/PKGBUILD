# Contributor: linuxSEAT <--put_my_name_here--@gmail.com>

pkgname=eclipse-gems
pkgver=rc4
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='The Generic Eclipse Modeling System (GEMS)'
license=('EPL')
url='http://www.eclipse.org/gmt/gems/'
depends=('eclipse' 'eclipse-emf>=2.3' 'eclipse-gef')
source=("http://download.eclipse.org/modeling/gmt/gems/GEMS-SDK-incubation-N20080624-1238.zip")
md5sums=('12507ee15066cd12a2d74f5787451f5e')

build() {
	mkdir -p ${pkgdir}/usr/share/eclipse || return 1
	cp -r ${srcdir}/plugins ${pkgdir}/usr/share/eclipse/ || return 1
}
