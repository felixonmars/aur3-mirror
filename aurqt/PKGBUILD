# Maintainer: Kwpolska <kwpolska@kwpolska.tk>
pkgname=aurqt
_pyname=aurqt
pkgver=0.2.2
pkgrel=1
pkgdesc='A graphical AUR manager.'
arch=('any')
url='https://github.com/Kwpolska/aurqt'
license=('BSD')
depends=('python' 'pyalpm>=0.5.1-1' 'python-requests' 'pkgbuilder>=3.0.1-1'
         'pyqt' 'python-beautifulsoup4' 'xterm')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/$(echo ${_pyname} | cut -c1)/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('7c551b4e4766d7e5ffd48aeaad2fd453')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
