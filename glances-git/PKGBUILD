# Maintainer: Alessio Sergi <asergi at archlinux dot us>

pkgname=glances-git
pkgver=2.0.r0.g49deea5
pkgrel=1
pkgdesc="A cross-platform curses-based system monitoring tool"
arch=('any')
url="https://github.com/nicolargo/glances"
license=('LGPL3')
depends=('python-psutil' 'python-setuptools')
makedepends=('git')
optdepends=('hddtemp: HDD temperature monitoring support'
            'python-bottle: Web server mode'
            'python-pysnmp: SNMP support'
            'python3-sensors-hg: hardware monitoring support')
provides=('glances')
conflicts=('glances')
source=('git://github.com/nicolargo/glances.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/glances
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//'
}

build() {
  cd "$srcdir"/glances
  python setup.py build
}

package() {
  cd "$srcdir"/glances
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
