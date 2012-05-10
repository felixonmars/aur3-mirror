# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: György Balló <ballogy@freestart.hu>
# Contributor: Kessia 'even' Pinheiro <kessiapinheiro at gmail.com>
# Contributor: Hugo Doria <hugodoria@gmail.com>
# Contributor: CainÃ£ Costa <cainan.costa@gmail.com>

pkgname=textflow
pkgver=0.2.9
pkgrel=3
pkgdesc="A text editor oriented for programming and written in PyGTK"
arch=('any')
url="https://launchpad.net/textflow"
license=('GPL2')
depends=('dbus-python' 'desktop-file-utils' 'pygtksourceview2'
         'python2-gconf' 'python2-gnomevfs' 'python-wnck')
install="${pkgname}.install"
source=("http://ppa.launchpad.net/textflow-dev/ppa/ubuntu/pool/main/t/textflow/${pkgname}_${pkgver}-4.tar.gz"
        "language_dirs.patch"
        "desktop_file.patch")
md5sums=('31023e8688b6359a2319abc974d3bc47'
         'f08605ff1510b315c5254d1fb2553b1c'
         'edada0c6084aeab3f111c977086da767')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np1 -i ../language_dirs.patch
  patch -Np1 -i ../desktop_file.patch
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python2 setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
}
