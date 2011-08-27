# Maintainer: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=bubbman2
pkgver=DX
pkgrel=3
pkgdesc="An Adventure Island style platformer made for PyWeek #8"
url="http://www.pygame.org/project/1114/?release_id=2054"
license=('GPL')
arch=('i686' 'x86_64')
depends=('python-pygame')
source=(http://pymike.pynguins.com/downloads/BubbMan2-$pkgver.zip bubbman2.desktop)
md5sums=('b68b30abdff6a88c007e00a0bbde5a00' 'ed74bf82a3c8b59ab674c44920ce440d')

build() {
  cd "${srcdir}/BubbMan2-DX"
  mkdir -p ${pkgdir}/usr/share/{bubbman2,applications}
  cp -R * ${pkgdir}/usr/share/bubbman2
  mkdir -p ${pkgdir}/usr/bin
  echo "cd '/usr/share/bubbman2/' && python run_game.py" > ${pkgdir}/usr/bin/bubbman2.sh
  chmod 755 ${pkgdir}/usr/bin/bubbman2.sh
  install ${srcdir}/bubbman2.desktop ${pkgdir}/usr/share/applications
}
