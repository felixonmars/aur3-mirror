# Maintainer: <kfgz at interia dot pl>

pkgname=tkinter-treectrl
pkgver=1.0
pkgrel=1
pkgdesc="The TkTreectrl module wraps the treectrl tk extension for use with Python/Tkinter"
arch=('i686' 'x86_64')
url="http://klappnase.bubble.org/TkinterTreectrl/index.html"
license=('GPL')
depends=('python2')
#source=(http://klappnase.bubble.org/download/TkinterTreectrl-${pkgver}.zip)
source=(http://kfgz.mydevil.net/TkinterTreectrl-${pkgver}.zip)
md5sums=('2f8b7359bb7e9b13e8373b725618f975')

package() { 
  cd "${srcdir}/TkinterTreectrl-${pkgver}"
  python2 setup.py install --prefix=/usr --root=${pkgdir}
}
