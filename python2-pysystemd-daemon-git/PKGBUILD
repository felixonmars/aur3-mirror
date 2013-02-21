# Maintainer: Felix Yan <felixonmars@gmail.com>

_pkgname=pysystemd-daemon
pkgname=python2-$_pkgname-git
pkgver=20130221
pkgrel=1
pkgdesc="systemd's sd_notify for Python"
arch=('any')
url=https://github.com/kirelagin/pysystemd-daemon
license=("GPL")
depends=('python2' 'systemd')

_gitroot="https://github.com/kirelagin/$_pkgname"
_gitname=$_pkgname

build() {
  cd "$srcdir"
  msg "Connecting to github.com GIT server...."

  if [ -d "$srcdir"/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
    cd $_gitname
  fi

  msg "GIT checkout done or server timeout"

  python2 -c "import py_compile; py_compile.compile('sddaemon/__init__.py')"
}

package() {
  cd "$srcdir"/$_gitname
  
  install -Dm644 sddaemon/__init__.py "$pkgdir/usr/lib/python2.7/site-packages/sddaemon/__init__.py"
  install -Dm644 sddaemon/__init__.pyc "$pkgdir/usr/lib/python2.7/site-packages/sddaemon/__init__.pyc"
}
