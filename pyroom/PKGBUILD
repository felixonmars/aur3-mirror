# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Maintainer: Gianmarco Brocchi (gimmy) <brocchi@poisson.phc.unipi.it>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Wade Nelson (hollywoodb) <wade.nels@gmail.com>

pkgname=pyroom
pkgver=0.4.1
pkgrel=4
pkgdesc='Distraction free full-screen text editor.'
arch=('any')
url='http://pyroom.org/'
license=('GPL3')
depends=('python' 'pygtk' 'pyxdg')
# makedepends=('bzr')
optdepends=('python-gconf: for GNOME default fonts support')
source=("http://launchpad.net/${pkgname}/${pkgver:0:3}/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz" 
"languages.patch")
md5sums=('35e6dfb611b2732471a78f88465ebf7f'
         'cd1acb811e19ce73d42457bc315dd5aa')

build() {
  cd ${pkgname}-${pkgver}
  patch -i "$srcdir/languages.patch" -p1 || return 1

  python2 setup.py build
}

package() {
  cd ${pkgname}-${pkgver}

  python2 setup.py install --root ${pkgdir} --optimize=1

  # probably needs to get fixed upstream
  install -D -m644 ${pkgname}.1 \
    ${pkgdir}/usr/share/man/man1/${pkgname}.1
}
