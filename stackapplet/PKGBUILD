pkgname=stackapplet
pkgver=1.4.0
pkgrel=1
pkgdesc="a small status icon that sits in your desktop's notification area and alerts you to events that happen to your StackExchange accounts."
arch=('any')
url="http://launchpad.net/stackapplet"
license=('MIT')
depends=('python2' 'python-notify')

build() {
  cd $srcdir
  
  msg "Downloading tarball"
  wget http://launchpad.net/stackapplet/1.4/1.4/+download/stackapplet_1.4.0_all.tar.gz -O stackapplet.tar.gz
}

package() {
  cd $srcdir
  
  tar -xf stackapplet.tar.gz
  sed -i "s|python|python2|" usr/share/applications/stackapplet.desktop
  mv usr/ $pkgdir/
}