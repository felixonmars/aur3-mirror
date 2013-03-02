# Contributor: James Boocock <sfk2001@gmail.com>
# Maintainer : James Boocock <sfk2001@gmail.com>

pkgname=pyvcf-git
pkgver=20130302
pkgrel=1
pkgdesc="PyVCF is a python library for using Variant Call format files in python scripts"
url=("http://github.com/jamescasbon/PyVCF")
license=('custom')
arch=('i686' 'x86_64')
makedepends=('git')

_gitroot=("https://github.com/jamescasbon/PyVCF.git")
_gitname=("PyVCF")

build() {
    cd ${srcdir}
    if [ -d ${srcdir}/${_gitname} ]; then
        msg "Git Checkout: Updating existing tree"
        cd ${_gitname} && git pull origin
        msg "Git Checkout: Tree has been updated"
    else
        msg "Git Checkout: Retrieving sources"
        git clone ${_gitroot}
    fi
    echo "Build Python"
}

package() {
    depends=('python' 'python-distribute')
    provides=('pyvcf-git=${pkgver}')
    conflicts=("pyvcf-git")
    replaces=("pyvcf-git")
    cd "${srcdir}/$_gitname"
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
    install -m755 -d "${pkgdir}/usr/share/licenses/PyVCF-git"
    install -m644 LICENSE "${pkgdir}/usr/share/licenses/PyVCF-git"
  
}
