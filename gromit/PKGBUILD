# Contributor: HuntXu <huntxu@live.cn>
# Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=gromit
pkgver=20041213
pkgrel=2
pkgdesc="Gromit (GRaphics Over MIscellaneous Things) is a small tool to make annotations on the screen."
url="http://www.home.unix-ag.org/simon/gromit/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('gtk2' 'cairo-ubuntu')
source=("http://www.home.unix-ag.org/simon/${pkgname}/${pkgname}-${pkgver}.tar.gz"
		'patch')
md5sums=('86fd67cfe62b1b955ddcd821e14a8c14'
         '2da0db8d6068a739907d8a5e0c054c43')

build() 
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Ni ${srcdir}/patch
  make
}

package()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
