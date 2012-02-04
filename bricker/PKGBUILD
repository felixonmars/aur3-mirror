
# Maintainer: Dany Martineau <dany.luc.martineau gmail.com>

pkgname=bricker
pkgver=1.0.0
pkgrel=2
pkgdesc="A puzzle type game using a block of bricks as the main character."
arch=('i686' 'x86_64')
url="https://launchpad.net/bricker/"
license=('GPL3')
depends=('sdl_image')
madepends=('make')
source=(http://launchpad.net/${pkgname}/${pkgver}/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz bricker.desktop)
md5sums=('70942f58b7510c3e0381e069df58711a' 'e577151166be3da7c7fc3a544d72c269')

build() {
cd ${srcdir}
make || return 1
mkdir -p ${pkgdir}/usr/share/{applications,bricker}
cp -R other levels media readme bricker GPL-3 AUTHORS ChangeLog ${pkgdir}/usr/share/bricker
install ${srcdir}/bricker.desktop ${pkgdir}/usr/share/applications
  echo "#!/bin/bash" >> bricker.sh
  echo "cd /usr/share/bricker/" >> bricker.sh
  echo "./bricker" >> bricker.sh
mkdir -p ${pkgdir}/usr/bin
install -m 755 bricker.sh ${pkgdir}/usr/bin
}
