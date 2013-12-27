# Maintainer: panchomora <contacto[AT]panchomora[dot]cl>

pkgname=matrilineare-icon
pkgver=0.3
pkgrel=2
pkgdesc="Trying to combine the simplicity of Elementary with the perfection of Faenza."
arch=('any')
url='http://sora-meliae.deviantart.com/art/Matrilineare-version-0-3-321379531'
license=('GPL3') 

source=('http://goo.gl/IM8ShC')
md5sums=('a7a5421387cd399538aada234e368754') 
package() {
  # Extract
  cd $srcdir
  
  # create theme dirs
  install -d -m 755 "$pkgdir"/usr/share/icons/Matrilineare

  # install theme
  cd $srcdir/Matrilineare
  cp -r . "$pkgdir"/usr/share/icons/Matrilineare/
  find "${pkgdir}"/usr/share/icons -type d -exec chmod 755 '{}' \;
  find "${pkgdir}"/usr/share/icons -type f -exec chmod 644 '{}' \;
}