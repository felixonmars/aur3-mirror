# Contributor: Alex Abbott <smartboyathome@gmail.com>
pkgname=smartte-git
pkgver=20100718
pkgrel=2
pkgdesc="Smartboy's text editor, especially focusing on BBCode support."
arch=('any')
url="https://bbs.archlinux.org/viewtopic.php?id=101233"
license=('GPL')
depends=('pygtk' 'python-pyenchant')
makedepends=('git')
source=(smartte)
md5sums=('c88a510a92a9ea7d866f9aa4ac0e654a')

_gitroot="git://github.com/smartboyathome/SmartTE.git"
_gitname="master"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  install -m 755 -D SmartTE.py ${pkgdir}/usr/share/SmartTE/SmartTE.py
  install -m 755 -D undostack.py ${pkgdir}/usr/share/SmartTE/undostack.py
  install -m 755 -D ../smartte ${pkgdir}/usr/bin/smartte
} 
