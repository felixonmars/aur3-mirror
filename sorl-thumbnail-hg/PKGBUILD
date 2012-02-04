#Contributor: Matt Sicker <boards at gmail dot com>
pkgname=sorl-thumbnail-hg
pkgver=362
pkgrel=1
pkgdesc='Thumbnailer library, mainly for Django.'
arch=(i686 x86_64)
url='http://code.google.com/p/sorl-thumbnail/'
license=('custom')
depends=('python')
makedepends=('mercurial')
optdepends=('django' 'imagemagick' 'wv2')
provides=('sorl-thumbnail')
md5sums=()

_hgroot='https://sorl-thumbnail.googlecode.com/hg/'
_hgrepo='sorl-thumbnail'

build() {
  cd $srcdir

  if [ -d $_hgrepo/.hg ]; then
    (cd $_hgrepo && hg up -r $pkgver)
  else
    hg clone -r $pkgver $_hgroot/$_hgrepo $_hgrepo
  fi

  msg 'Mercurial checkout done or server timeout'

  if [ -d $_hgrepo-build ]; then
    msg 'Removing old build directory'
    rm -rf $_hgrepo-build
  fi

  msg 'Copying repository to another build directory'
  cp -r $srcdir/$_hgrepo $srcdir/$_hgrepo-build

  msg 'Starting build'
  cd $srcdir/$_hgrepo-build

  msg 'Running setup.py'
  python setup.py build || return 1
  python setup.py install --root=$pkgdir || return 1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || return 1
}
