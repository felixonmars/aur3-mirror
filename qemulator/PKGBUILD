# vim:set ts=2 sw=2 et:

pkgname=qemulator
_srcdirname=Qemulator
pkgver=0.5
pkgrel=1
pkgdesc='A solution for easy setup and management of qemu'
arch=('any')
url="http://${pkgname}.createweb.de/"
license=('GPL2')
depends=('python2>=2.4' 'pygtk>=2.8' 'qemu>=0.8.1')
optdepends=('gnome-python-extras: Tray functionnality')
options=(!emptydirs)
source=("${url}plugins/downloads/dodownload.php?file=Qemulator-${pkgver}.tar.gz")
md5sums=('a2ab585f2a987b5fafa5f76b785d6c1a')

#The PKGBUILD does not use setup.py script because it is a graphical installer 
#and it seems it is not possible to use it in a command line mode

build() {
  cd "${srcdir}/${_srcdirname}-${pkgver}" 
  sed -i '1 s/python/\02/' "usr/local/lib/${pkgname}"/*.py
  mv usr/local/* usr/
  rmdir usr/local
}

package() {
  cd "${srcdir}/${_srcdirname}-${pkgver}"
  cp -R usr/ "${pkgdir}"
  install -o root -g root -m644 -D README "${pkgdir}/usr/share/licenses/${pkgname}/README"
} 
