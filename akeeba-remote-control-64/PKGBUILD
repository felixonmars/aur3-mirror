# Contributor: Fabrizio Antonangeli <fabrizio.antonangeli@gmail.com>

pkgname=akeeba-remote-control-64
pkgver=4.0.8
pkgrel=2
pkgdesc="Desktop application which allows you to backup multiple joomla sites (with Akeeba Backup) with a single click."
url="https://www.akeebabackup.com/software/akeeba-remote-control.html"
license=('GPL2')
arch=('x86_64')
depends=('libjpeg-turbo' 'python2' 'libnotify' 'yajl')
source=(http://cloud2.appcelerator.net/linux_64bit_i386/db7dd75e6235bb236fb083233a3b869b/daa990b8-5025-49ef-acdd-35ed66dfd30c/Remote%20Control-$pkgver.tgz akeeba-remote-control)
md5sums=('6edb1b3517350b6d9813706fd7814c60'
         '61e6e16e09d4e0a206c99ed5bcdc3e1f')


build() {
  cd $startdir/src
  
  mkdir -p $startdir/pkg/usr/lib/
  mv Remote\ Control-$pkgver $startdir/pkg/usr/lib/akeeba-remote-control
  chmod -R 755 $startdir/pkg/usr/lib/akeeba-remote-control
  
  
  install -D -m755 akeeba-remote-control $startdir/pkg/usr/bin/akeeba-remote-control

  ln -s /usr/lib/libjpeg.so $startdir/pkg/usr/lib/libjpeg.so.62
  ln -s /usr/lib/libpython2.7.so $startdir/pkg/usr/lib/libpython2.5.so.1.0
  ln -s /usr/lib/libnotify.so $startdir/pkg/usr/lib/libnotify.so.1
  ln -s /usr/lib/libyajl.so $startdir/pkg/usr/lib/libyajl.so.1
}
