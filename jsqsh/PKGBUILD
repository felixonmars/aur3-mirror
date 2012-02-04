# Maintainer: elimat <matthias[dot]eliasson[at]gmail[dot]com>

pkgname=jsqsh
pkgver=1.4
pkgrel=2
pkgdesc="A Java re-implementation of a tool that originally authored called sqsh"
makedepends=('deb2targz' 'tar')
arch=('x86_64' 'i686')
license=('GPL')
url="http://jsqsh.wiki.sorceforge.net"

	if [ "${CARCH}" = "x86_64" ]; then
	md5sums=('c55b7265ae1a6b76e829c1e4808f226e'
			'84a39a5f1551a70133607faf72bd119c')
	_carch=.x86_64
	elif [ "${CARCH}" = "i686" ]; then
	md5sums=('9d708e4b3ca8e603daade6de98a3714d'
			'84a39a5f1551a70133607faf72bd119c')
	_carch=-i386
	fi
depends=('jdk' 'java-readline')
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}-1${_carch}.deb"
		'jsqsh.jar')

build() {
  pwd
  deb2targz ${pkgname}-${pkgver}-1${_carch}.deb > /dev/null || return 1
  tar -xzf ${pkgname}-${pkgver}-1${_carch}.tar.gz || return 1

  mv usr/ ${pkgdir}/
  mv jsqsh.jar ${pkgdir}/usr/share/jsqsh

}
