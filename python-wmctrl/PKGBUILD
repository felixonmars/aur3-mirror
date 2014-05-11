
pkgname=python-wmctrl
pkgver=0.1
pkgrel=1
pkgdesc="A tool to programmatically control windows inside X"
url="https://bitbucket.org/antocuni/wmctrl"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python')
source=("hg+https://bitbucket.org/antocuni/wmctrl")
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/wmctrl"
  sed -i "s|from commands|from subprocess|g" wmctrl.py
  sed -i "s|parts = map(str.strip, parts)|parts = list(map(str.strip, parts))|g" wmctrl.py
  sed -i "s|parts[1:7] = map(int, parts[1:7])|parts[1:7] = list(map(int, parts[1:7]))|g" wmctrl.py 
}

build() {
  cd "${srcdir}/wmctrl"
  python setup.py build
} 

package() {
  cd "${srcdir}/wmctrl"
  python setup.py install --root=${pkgdir}
}
