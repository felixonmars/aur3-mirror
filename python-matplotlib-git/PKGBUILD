# Submiter: Mitchel Humpherys <mitch.special@gmail.com>
# Mantainer: Hector Martinez-Seara Monne <hseara##a##gmail##.##com>

pkgname=python-matplotlib-git
pkgver=v1.3.1rc2.r1358.gb50b937
pkgrel=1
pkgdesc="matplotlib python library (including python3 support)"
url="https://github.com/matplotlib/matplotlib"
arch=('any')
license=('custom')
depends=('python-numpy' 'python-dateutil' 'python-pytz' 'freetype2' 'libpng' 'python-tornado' 'python-nose' 'python-pyparsing')
makedepends=('git')
replaces=('python3-matplotlib-git')
provides=('python-matplotlib')
conflicts=('python-matplotlib')
source=('git+https://github.com/matplotlib/matplotlib.git'
        'setup.cfg')
md5sums=('SKIP'
         '9e74e90b164757a1fd327680cdf4486e')

_gitname='matplotlib'

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_gitname}"
  cp "${startdir}/setup.cfg" "${srcdir}/${_gitname}/"

  python setup.py build
}

package() {
  cd "${srcdir}/${_gitname}"
  python setup.py install --prefix=/usr --root=${pkgdir} -O1 --skip-build
  #cd "${pkgdir}/usr/lib/python3.4/site-packages/"
  #rm -rf __pycache__ easy-install.pth site.py
  install -dm755 "${pkgdir}"/usr/share/licenses/${_gitname}
  install -m644 ${srcdir}/${_gitname}/LICENSE/LICENSE "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
  
}
