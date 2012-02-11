# Maintainer: Elena Grandi <elena.valhalla@gmail.com>
pkgname=python2-fulltext
pkgver=0.2.1
pkgrel=1
pkgdesc="Convert binary files to plain text for indexing."
arch=(any)
url="http://github.com/btimby/fulltext/"
license=('GPL3')
depends=('python2')
optdepends=('poppler: pdf support'
    'antiword: doc support'
    'docx2txt: docx support'
    'catdoc: xls support'
    'perl-xls2csv: xls support'
    'unrtf: rtf support'
    'odt2txt: odt support'
    'unzip: zip support'
    'gzip: tar.gz support'
    'tar: tar support'
    'bzip2: tar.bz support'
    'unrar: rar support'
    'html2text: html support'
    'binutils: application/octet-stream support')
options=(!emptydirs)
install=
source=(https://github.com/downloads/btimby/fulltext/fulltext-0.2-1.tar.gz)
md5sums=('2f939fb5905fc95b062462d803255232')

_dirname=fulltext
_dirver=0.2-1

package() {
  cd "$srcdir/$_dirname-$_dirver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
