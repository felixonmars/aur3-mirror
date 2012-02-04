# Maintainer: osily <ly50247 at gmail dot com>

pkgname=lrcshow-x-svn
pkgver=285
pkgrel=1
pkgdesc="A lyrics plugins written by pyqt4, supporting Amarok2, Qmmp, Audacious and other Linux Players with full dbus interface functions."
arch=('any')
url="http://www.sanfanling.cn"
license=('GPL')
depends=('python2-qt' 'pygobject' 'dbus-python')
makedepends=('subversion')
provides=('lrcshow-x')
conflicts=('lrcshow-x')

_svntrunk=http://www.sanfanling.cn/svn/lrcShow-X/trunk/lrcShow-X
_svnmod=lrcshow-x-svn

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"

}

package() {
  cd "$srcdir/$_svnmod-build"

  install -d "${pkgdir}/usr/"{bin,share}

  cp -r "$srcdir/$pkgname" "${pkgdir}/usr/share/"

  sed -i '1s/python$/python2/' "$pkgdir"/usr/share/lrcshow-x-svn/lrcShow-X.py
  find "$pkgdir" -type d -name '\.svn' -exec rm -rf {} +

  cat > "$pkgdir/usr/bin/lrcShow-X" <<'EOF'
#!/bin/bash
cd /usr/share/lrcShow-X/
./lrcShow-X.py "$@"
exit 0'
EOF

}
