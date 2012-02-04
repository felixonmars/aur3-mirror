# Contributor: Jostein Bø Fløystad <josteinb at stud dot ntnu dot no>
pkgname="python-savgol"
pkgver=1.0
pkgrel=1
pkgdesc="A Python module implementing Savitzky-Golay smoothening filters."
arch=('i686' 'x86_64')
url="http://www.procoders.net"
license=('GPL')
depends=('python' 'python-numpy')
makedepends=('unzip')
source=("http://www.procoders.net/wp-content/savitzky_smoother.zip" \
"http://folk.ntnu.no/josteinb/arch/python-savgol/setup.py")
noextract=()
md5sums=('31a30a8e4161511f863a36e655271053' '08a2dd6667a652d53948ef1083168ff0')

build() {
  cd "$srcdir/savitzky_smoother"
  ln -s ../setup.py setup.py
  python setup.py install --root=${pkgdir} --prefix=/usr
}

# vim:set ts=2 sw=2 et:
