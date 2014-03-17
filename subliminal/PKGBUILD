# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=subliminal
pkgver=0.7.4
pkgrel=1
pkgdesc="Search and download subtitles."
arch=(any)
url="https://github.com/Diaoul/subliminal"
license=(LGPL)
depends=('python2'
         'python2-beautifulsoup4>=4.3.2'
         'python2-guessit>=0.6.2'
         'python2-requests>=2.0.1'
         'python2-enzyme>=0.4.0'
         'python2-html5lib>=0.99'
         'python2-dogpile-core>=0.4.1'
         'python2-dogpile-cache>=0.5.2'
         'python2-babelfish>=0.4.0'
         'python2-charade>=1.0.3'
         'python2-pysrt>=0.5.0')
optdepends=('python2-lxml: for faster processing'
            'python2-colorlog: for logs with colors')
makedepends=('python2-distribute')
changelog=Changelog
conflicts=(${pkgname}-git)
source=("http://pypi.python.org/packages/source/s/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('9d74b9a100ba66636e8397a3970ea54d')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
