# Maintainer: archtux <antonio.arias99999 at gmail.com>

pkgname='cuevanalinks-gui-hg'
pkgver=187
pkgrel=1
pkgdesc="GUI to download movies or series from cuevana.tv"
url="http://nqnwebs.com/blog/article/cuevanalinks-ahora-para-seres"
license='GPL3'
arch=('any')
depends=('plac' 'python2-progressbar' 'python2-pyqt' 'python2-pyquery')
makedepends=('mercurial')
source=('http://sc.cuevana.tv/img/logo.png')
md5sums=('5dd620509cc09f81ae6c1b796b068e87')

_hgroot='https://bitbucket.org/tin_nqn'
_hgrepo='cuevanalinks'

build() {
  cd $srcdir

  msg "Connecting to $_hgroot"
  if [ -d $_hgrepo ]; then
    cd $_hgrepo
    hg pull -u
    msg2 "Finished updating the local repository!"
  else
    hg clone $_hgroot/$_hgrepo
    msg2 "Initial pull complete!"
  fi

  rm -rf ${srcdir}/${_hgrepo}-build
  cp -a ${srcdir}/${_hgrepo} ${srcdir}/${_hgrepo}-build
  cd ${srcdir}/${_hgrepo}-build

  hg update test_gui
  python2 setup.py install --root=$pkgdir --optimize=1

  # Desktop icon
  cd $startdir
  install -Dm644 logo.png $pkgdir/usr/share/pixmaps/cuevanalinks.png
  install -Dm644 cuevanalinks.desktop $pkgdir/usr/share/applications/cuevanalinks.desktop
}