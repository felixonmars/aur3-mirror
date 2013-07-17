# Maintainer: Sam Stuewe <halosghost at archlinux dot info>
# Contributor: solsTiCe d'Hiver <solstice.dhiver@gmail.com>
# Contributor: utdemir <utdemir@riseup.net>
_name=pelican
pkgname="${_name}-git"
pkgver=1855.9b0cfd9
pkgrel=1
epoch=1
pkgdesc="Static blog generator in python, using ReST or Markdown syntax"
arch=('any')
url="http://getpelican.com"
license=("GPL3")
depends=('python-six' 'python-docutils' 'python-jinja' 'python-feedgenerator' 
         'python-pygments' 'python-pytz' 'python-blinker' 'python-unidecode')
optdepends=('python-markdown: for markdown support')
makedepends=('git')
provides=('pelican')
conflicts=('pelican')
replaces=('pelican')
source=("${_name}::git://github.com/getpelican/${_name}.git")
sha256sums=('SKIP')

pkgver() {
   cd "${_name}"
   echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
	cd "${_name}"
	python ./setup.py install --root="${pkgdir}"
}

