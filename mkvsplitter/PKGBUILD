# Contributor: Mladen Pejakovic <pejakm@gmail.com>

pkgname=mkvsplitter
pkgver=0.3.2
pkgdesc="MKVSplitter is a program to split MKV files by their chapter information"
pkgrel=1
arch=(i686 x86_64)
_kdeapps=143782
url="http://kde-apps.org/content/show.php?content=${_kdeapps}"
license=(GPL)
makedepends=('cmake' 'automoc4')
depends=('python2' 'python-configobj' 'kdebindings-python' 'mkvtoolnix')
optdepends=('mplayer: for previews')
options=()
source=(http://kde-apps.org/CONTENT/content-files/${_kdeapps}-${pkgname}-${pkgver}.tar.bz2)
md5sums=('d940f87ec7842b70ce1f80f59af03f33')

package(){
  cd ${srcdir}/${pkgname}
  install -m755 -d "${pkgdir}/usr/lib/mkvsplitter/"
  install -m755 -d "${pkgdir}/usr/bin/"
  install -m755 * "${pkgdir}/usr/lib/mkvsplitter/"
  ln -s "/usr/lib/mkvsplitter/mkvsplitter.py" "${pkgdir}/usr/bin/mkvsplitter"
  rm -rf "${pkgdir}/usr/lib/mkvsplitter/configobj.py"
  find ${pkgdir}/ -name "*.pyc" -type f -exec rm -fr '{}' \;
}
