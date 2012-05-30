# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=python2-markdown-video
_pkgname=python-markdown-video
pkgver=0.1.6
pkgrel=2
pkgdesc="Python markdown 2.0 extension for easy video embedding"
arch=('any')
url="http://code.google.com/p/python-markdown-video/"
license=('LGPL')
depends=('python2-markdown')
source=(http://python-markdown-video.googlecode.com/files/${_pkgname}-${pkgver}.tar.bz2)
md5sums=('45f03da66eff0f0edb3f6505d63267d7')
sha1sums=('cf4922cee77a703b78e4dcdb86c94accbffa14f5')

build() {
  cd $srcdir/$_pkgname

  python2 setup.py install --root=${pkgdir}

  # Create some symlinks
  _pyver=$(python2 -c 'import sys; print sys.version[:3]')
  install -d $pkgdir/usr/lib/python${_pyver}/site-packages/markdown/extensions
  cd $pkgdir/usr/lib/python${_pyver}/site-packages/markdown/extensions
  ln -s ../../mdx_video.py
}
