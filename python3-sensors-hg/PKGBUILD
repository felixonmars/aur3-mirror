pkgname=python3-sensors-hg
_pkgname=py3sensors
pkgver=14
pkgrel=1
pkgdesc='Python3 bindings to libsensors'
arch=('any')
url='https://bitbucket.org/gleb_zhulik/py3sensors'
license=('GPL')
depends=('python' 'lm_sensors')

_hgroot='http://bitbucket.org/gleb_zhulik/'
_hgrepo='py3sensors'

build() {
  cd $srcdir

  if [ -d $_hgrepo/.hg ]; then
    (cd $_hgrepo && hg up -r $pkgver)
  else
    hg clone $_hgroot/$_hgrepo $_hgrepo
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
}