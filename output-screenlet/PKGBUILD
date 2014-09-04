# Maintainer: Hydranix <Hydranix@gmx.com>

pkgname=output-screenlet
pkgver=0.2.3
pkgrel=1
_ubuntu=~trusty1_all
pkgdesc="A screenlet that displays output from any UNIX command"
arch=('any')
url="https://launchpad.net/indiv-screenlets"
license=('GPL')
depends=('python2' 'screenlets')
source=("http://ppa.launchpad.net/screenlets/ppa/ubuntu/pool/main/o/${pkgname}/${pkgname}_${pkgver}${_ubuntu}.deb")
md5sums=('2105cc18e726f9b5f12ee3de35448b6f')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"
  
  # Fix python v2 to 'python2'
  sed 's#env python#env python2#' \
    -i "${pkgdir}"/usr/share/screenlets/Output/OutputScreenlet.py    
  sed 's#python#python2#' \
    -i "${pkgdir}"/usr/share/applications/screenlets/output-screenlet.desktop
  
  rm -rf "${pkgdir}"/usr/share/doc
}

