# Maintainer: <clu@eeviac>

pkgname=python2-urubu
_pkgname=urubu
pkgver=0.7
pkgrel=1
epoch=
pkgdesc="A micro CMS for static websites, with a focus on good navigation practices."
arch=('i686' 'x86_64')
url="http://urubu.jandecaluwe.com/"
license=('GNU Affero')
groups=()
depends=('python2-jinja>=2.7' 'python2-pygments' 'python2-markdown' 'python2-markdown-checklist' 'python2-yaml')
makedepends=(python2-setuptools)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=(https://github.com/jandecaluwe/$_pkgname/archive/$pkgver.tar.gz
        .AURINFO)
md5sums=('4f037e7404e91ff79a02a446124724d9'
         'cad2614bd5b9f4a5fbb386c42f4a8577')
noextract=()


package() {
  cd $_pkgname-$pkgver

  python2 setup.py install --root=$pkgdir --prefix=/usr --optimize=1
}

