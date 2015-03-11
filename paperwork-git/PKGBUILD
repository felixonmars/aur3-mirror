#Contributor: mathieu.clabaut <mathieu.clabaut@gmail.com>

pkgname=paperwork-git
pkgver=20140820
pkgrel=2
pkgdesc="a tool to make papers searchable - scan & forget"
arch=('i686' 'x86_64')
url="https://github.com/jflesch/paperwork"
license=('GPL2')
provides=('paperwork')
conflicts=('paperwork')
makedepends=('python2')
depends=('pygobject2-devel' 'pygtk' 'python2-pycountry'
'python2-imaging' 'python2-poppler' 'python2-pyinsane-git' 'python2-pyocr-git'
'python2-levenshtein' 'python2-whoosh' 'tesseract' 'python2-pyenchant'
'python2-gobject' 'python2-numpy' 'python2-scipy' 'python2-scikit-learn'
'python2-scikit-image' 'python2-termcolor')
optdeps=('cuneiform: alternativer OCR')
source=('paperwork::git://github.com/jflesch/paperwork.git')
md5sums=('SKIP')


package() {

  cd $srcdir/paperwork

  python2 ./setup.py install --root=$pkgdir  || return 1


}

