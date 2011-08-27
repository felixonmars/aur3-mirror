# Contributor: Andrew Grigorev <andrew@ei-grad.ru>
# Current maintainer: Kozec <kozec at kozec dot com>

pkgname=entertainer
pkgver=0.5.1
pkgrel=3
pkgdesc="Simple and easy-to-use media center solution for GNOME and Xfce desktop environments."
arch=('i686' 'x86_64')
url="https://launchpad.net/entertainer"
license=('GPL')
depends=('python2' 'pyclutter-gtk' 'pyclutter-gst' 'pycairo' 'cddb-py' 'imdbpy' 'python-eyed3' 'python-feedparser' 'pygobject' 'python-pysqlite' 'pyvorbis' 'python2-storm' 'twisted' 'pyxdg')
options=('!libtool')
source=('http://launchpad.net/entertainer/entertainer-0.5/entertainer-0.5.1/+download/entertainer-0.5.1.tar.gz')
md5sums=('5aaab41fc0aeaa836e4d43bee5b61398')
install="entertainer.install"

build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=${pkgdir} || return 1
}

