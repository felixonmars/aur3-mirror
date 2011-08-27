# Creator: Peter Feigl <craven@gmx.net>, Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
pkgname=morse-x
pkgver=0.20060903
pkgrel=1
pkgdesc="Use any key on your keyboard as morse key"
arch=('i686' 'x86_64')
url="http://pkqs.net/~sbeyer/#morse-x"
license=('GPL2')
depends=('sdl')
source=(http://pkqs.net/~sbeyer/tools/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz)
md5sums=('5a3200ebfac7a08d2dd6e96e38982ec2')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make || return 1
  make DESTDIR=${pkgdir} install
}
