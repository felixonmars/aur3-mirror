gitname=lazy
pkgname=python-${gitname}-git
pkgver=97.86e1e85
pkgrel=1
pkgdesc="making python lazily evaluated"
arch=('i686' 'x86_64')
url="https://github.com/llllllllll/lazy_python"
license=("GPL2")
makedepends=('git' 'python-setuptools')
depends=('python')
provides=('python-${gitname}')
conflicts=('python-${gitname}')
source=("git+https://github.com/llllllllll/${gitname}_python.git")
md5sums=('SKIP')

pkgver() {
	 cd "${srcdir}/${gitname}_python"
	 local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	 printf "%s" "${ver//-/.}"
}

package() {
	 cd "${srcdir}/${gitname}_python"
	 python setup.py install --root="${pkgdir}" --optimize=1
}