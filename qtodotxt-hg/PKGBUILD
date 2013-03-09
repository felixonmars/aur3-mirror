# Maintainer: Tobias Quinn <tobias@tobiasquinn.com>

pkgname=qtodotxt-hg
pkgver=0.1.0
pkgrel=4
pkgdesc="QTodoTxt - UI for lifehacker.com's todo.txt files (see todotxt.com)"
arch=('i686' 'x86_64')
url="https://bitbucket.org/3david/qtodotxt"
license=('GPL3')
depends=('python2-pyside')
makedepends=('mercurial')
optdepends=('todotxt: command line todo.txt')
provides=('qtodotxt')
install=$pkgname.install
source=(qtodotxt.png
qtodotxt.sh
qtodotxt.desktop)
md5sums=('6a97ac80190f9490c08c567795758901'
'ef08beb105c0f3c8d3cbbbabb30dd571'
'aa3efc9f4c62a6e5c1f8d84a801604f2')

_hgroot="https://bitbucket.org/3david/"
_hgname="qtodotxt"

build() {
  cd "$srcdir"
  hg clone -r 1f847d0d3ddb $_hgroot$_hgname
  
  msg "Mercurial checkout done or server timeout"

  # install bin
  install -D -m755 "${startdir}/qtodotxt.sh" "${pkgdir}/usr/bin/qtodotxt" || return 1

  cd "$srcdir/$_hgname"
  # remove the py2exe lines
  sed -i "s/import py2exe//g" setup.py
  sed -i "s/sys.path.append.*//g" setup.py
  # remove install of resources files
  sed -i "s/.*data_files=.*//g" setup.py
  sed -i "s/.*resources.*'\, resources.*//g" setup.py
  python2 setup.py install --root=$pkgdir/ || return 1

  # install resources files
  cp -r "${srcdir}/$_hgname/qtodotxt/ui/resources/" "${pkgdir}/usr/lib/python2.7/site-packages/$_hgname/ui/resources/" || return 1
  # install desktop file and icon
  install -Dm644 "${startdir}/qtodotxt.png" "${pkgdir}/usr/share/pixmaps/qtodotxt.png" || return 1
  install -Dm644 "${startdir}/qtodotxt.desktop" "${pkgdir}/usr/share/applications/qtodotxt.desktop" || return 1
}
