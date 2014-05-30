# Maintainer: Peter Lamby <peterlamby@web.de>
pkgname=livestreamer-curses-git
pkgver='1.2.0' 
pkgrel=1
pkgdesc='A curses frontend to livestreamer.'
arch=('any')
url="https://github.com/gapato/livestreamer-curses"
license=('MIT')
depends=('livestreamer' 'ncurses')
options=(!strip)
source=('git+https://github.com/gapato/livestreamer-curses#branch=master')
md5sums=('SKIP')

package() {
	cd livestreamer-curses
	python setup.py install --root="$pkgdir/" --optimize=1
}
