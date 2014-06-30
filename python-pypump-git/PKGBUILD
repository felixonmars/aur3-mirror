# Maintainer: Storm Dragon <stormdragon2976@gmail.com> 

pkgbase=python-pypump-git
pkgname=("python-pypump-git" "python2-pypump-git")
pkgver=v0.5.r76.gc73e093
pkgrel=2
pkgdesc="An interface to the pump.io API's."
arch=('any')
url="https://github.com/xray7224/pypump"
license=('GPL3')
source=("git+https://github.com/xray7224/pypump.git")
md5sums=('SKIP')

pkgver()
{
  cd "${srcdir}/pypump"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
 
package_python-pypump-git()
{
  depends=('python' 'python-requests' 'python-requests-oauthlib' 'python-six' 'python-dateutil')
makedepends=('python-setuptools')
  cd "${srcdir}/pypump"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-pypump-git()
{
  depends=('python2' 'python2-requests' 'python2-requests-oauthlib' 'python2-six' 'python2-dateutil')
makedepends=('python2-setuptools')
  cd "${srcdir}/pypump"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
