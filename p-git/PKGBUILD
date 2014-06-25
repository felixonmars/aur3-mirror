# Maintainer: Storm Dragon <stormdragon2976@gmail.com>

pkgname=p-git
pkgver=30
pkgrel=1
pkgdesc="a pump.io version of the command line utility t"
arch=('any')
url="https://github.com/xray7224/p"
license=('GPL3+')
depends=('python2-dateutil' 'python2-html2text' 'python2-pytz' 'python2-click' 'python2-pypump-git')
makedepends=('git' 'python2-setuptools')
provides=("p")
conflicts=("p")
source=("git+https://github.com/xray7224/p.git")
md5sums=("SKIP")

pkgver()
{
  cd "${srcdire}/p"
  git shortlog | head -n 1 | tr -Cd "[:digit:]"
}
 
package()
 {
  cd "${srcdir}/p"
python2 setup.py install --root="${pkgdir}/" --optimize=1
  }

# vim:set ts=2 sw=2 et:
