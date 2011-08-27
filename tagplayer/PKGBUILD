# Maintainer: Kosava <kosava@archlinux.us>

pkgname=tagplayer
pkgver=0.2.05
pkgrel=1
pkgdesc="TagPlayer is a Boffin like application. It allows the user to play music based on the music's lastfm tags."
arch=('i686' 'x86_64')
url="https://launchpad.net/tagplayer"
license=('GPL3')
depends=('python-distutils-extra' 'pygobject' 'python-pyenchant' 'desktopcouch' 'mutagen')
makedepends=('python2')
conflicts=('tagplayer-bzr')
source=("http://launchpad.net/tagplayer/trunk/0.2.05/+download/tagplayer_0.2.05.tar.gz")
md5sums=('d00ebd1ec3a7c6e424490be9166eff62')

build() {
   cd $srcdir/$pkgname
   python2 setup.py install --prefix=$pkgdir/usr
}