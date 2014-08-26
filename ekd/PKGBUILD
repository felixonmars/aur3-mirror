# Contributor: Pierre Chapuis <catwell@archlinux.us>
# Contributor: ganymede
# Contributor: Nicolas Paris <nicolas.caen (AT) gmail.com>
# Contributor: Dany Martineau 

pkgname=ekd
pkgver=3.1.4
pkgrel=1
pkgdesc="Pictures and video post-production software"
arch=('i686' 'x86_64')
url="http://ekd.tuxfamily.org/"
license=('GPL')
depends=('mplayer' 'ffmpeg2theora' 'imagemagick' 'python2-pyqt4' 'python2-pillow' 'python2-numpy' 'mjpegtools' 'sox' 'mencoder')
source=("http://download.tuxfamily.org/ekdforum/ekd/appli/linux/sources/ekd_linux_source_3_1_4_20140816.tar.gz"
        'ekd.desktop'
        'ekd-pil.patch')
md5sums=('b0809959c61abd9720797e9deb4cce7a'
         '5c2212b3a13eb0a06d63d387626962b9'
         'ab5162495b68a8087982da8e3aa55653')

prepare () {
  cd ekd_linux_source_3_1_4_20140816
  patch -p1 -i "${srcdir}"/ekd-pil.patch
}
 
package() {
  install -d "$pkgdir"/usr/bin/ "$pkgdir"/usr/share/{ekd,applications} 
  echo '#!/bin/sh'$'\n''cd /usr/share/ekd && python2 ekd_gui.py' > "$pkgdir"/usr/bin/ekd
  chmod 755 $pkgdir/usr/bin/ekd
  cp -r ekd_linux_source_3_1_4_20140816/* "$pkgdir"/usr/share/ekd
  chmod -R 755 "$pkgdir"/usr/share/ekd
  install -m644 "$srcdir"/ekd.desktop "$pkgdir"/usr/share/applications
}

