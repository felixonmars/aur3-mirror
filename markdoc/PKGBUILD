# Maintainer: Mike Sampson <mike at sambodata dot com>
# Contributor: Patrick McCarty <pnorcks at gmail dot com>

pkgname=markdoc
_githubuser=zacharyvoase
pkgver=0.6.6
pkgrel=1
pkgdesc="A lightweight Markdown-based wiki system"
arch=(any)
url="http://markdoc.org/"
depends=('python2-argparse' 'python2-cherrypy' 'python2-jinja' 'python-markdown'
'python2-pygments' 'python2-yaml' 'python2-webob' 'python2' 'rsync')
license=('Custom')
source=(https://github.com/$_githubuser/$pkgname/tarball/v$pkgver)
md5sums=('946434366fdb647dbc76d24e8828ff2b')
sha256sums=('b10134db90252285cfcad8f01c83fa305705335e6e69495502ef8acdd52d506d')

build() {
  cd "$srcdir/$_githubuser-$pkgname-"*
  python2 setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
  install -Dm644 UNLICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
