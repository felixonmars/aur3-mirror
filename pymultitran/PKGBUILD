pkgname=pymultitran
pkgver=0.2
pkgrel=1
pkgdesc="CLI client for http://multitran.ru written in python."
arch=('any')
url="http://gist.github.com/veprbl/6312211"
license=(BSD)
depends=('python3')
source=('https://gist.github.com/veprbl/6312211/raw/13bf444f45c715a0871967389e5801bbda44891b/pymultitran.py')
md5sums=('1762a971efe1398d475a993ee8924682')
sha256sums=('f61f1705ec83a7c400a5d32f960c077761dc7fa4dceb9481edf583b2fb9a6ec8')

package() {
	install -Dm755 pymultitran.py "${pkgdir}/usr/bin/pymultitran"
}

# vim:set ts=2 sw=2 et:
