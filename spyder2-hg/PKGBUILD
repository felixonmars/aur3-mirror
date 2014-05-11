# Maintainer: willemw <willemw12@gmail.com>

_pkgname=spyder2
pkgname=$_pkgname-hg
pkgver=r3626.5c0af92927a3
pkgrel=2
pkgdesc="Scientific PYthon Development EnviRonment providing MATLAB-like features (Python 2 version)"
arch=('any')
url="https://bitbucket.org/spyder-ide/spyderlib"
license=('MIT')
depends=('python2-pyqt4' 'python2-pyflakes' 'python2-pyzmq' 'python2-pygments'
         'desktop-file-utils')
makedepends=('python2-sphinx' 'python2-setuptools'
             'mercurial')
optdepends=('python2-pylint: powerful code analysis'
            'ipython2: enhanced Python interpreter'
            'python2-rope: editor code completion, calltips and go-to-definition'
            'python2-sphinx: rich text help on the object inspector'
            'python2-numpy: N-dimensional arrays'
            'python2-scipy: signal/image processing'
            'python2-psutil: memory/CPU usage in the status bar'
            'python2-h5py: HDF5 support'
            'python2-matplotlib: interactive 2D/3D data plotting'
            'pep8-python2: real-time code style analysis'
            'python2-sympy: symbolic mathematics for the IPython console')
#provides=($_pkgname)
#conflicts=($_pkgname)
provides=('spyder')
conflicts=('spyder')
source=($pkgname::hg+https://bitbucket.org/spyder-ide/spyderlib)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
} 

prepare() {
  cd $pkgname
  sed -i "s|PYLINT_PATH = programs.find_program('pylint')|PYLINT_PATH = programs.find_program('pylint2')|" \
         spyderplugins/widgets/pylintgui.py
}

build() {
  cd $pkgname
  python2 setup.py build
}

package() {
  cd $pkgname
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 spyderlib/__init__.py "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm "$pkgdir/usr/bin/spyder_win_post_install.py"
}

