# Maintainer: ed0c <mur7augh at gmail dot com>

pkgname=lrcshow-x-bzr
pkgver=26
pkgrel=1
pkgdesc="A lyrics plugins written by pyqt4, supporting Amarok2, Qmmp, Audacious and other Linux Players with full dbus interface functions."
arch=('any')
url="http://www.sanfanling.cn"
license=('GPL')
depends=('python2-qt' 'pygobject' 'dbus-python')
makedepends=('bzr')
provides=('lrcshow-x')
conflicts=('lrcshow-x')

_bzrtrunk="lp:~lrcshow-x/lrcshow-x/2-series"
_bzrmod=$pkgname

build() {
  cd "$srcdir"

  msg "Connecting to the server...."

  if [ -d ${_bzrmod} ]; then
    bzr up ${_bzrmod}
    msg "The local files are updated."
  else
    bzr co ${_bzrtrunk} ${_bzrmod}
  fi

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_bzrmod-build"
  cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"

}

package() {
  cd "$srcdir/$_bzrmod-build"

  install -d "${pkgdir}/usr/"{bin,share}

  cp -r "$srcdir/$pkgname" "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/share/lrcshow-x-bzr" "${pkgdir}/usr/share/lrcShow-X"
  sed -i '1s/python$/python2/' "$pkgdir"/usr/share/lrcShow-X/lrcShow-X.py
  find "$pkgdir" -type d -name '\.bzr' -exec rm -rf {} +

  cat > "$pkgdir/usr/bin/lrcShow-X" <<'EOF'
#!/bin/bash
cd /usr/share/lrcShow-X/
./lrcShow-X.py "$@"
exit 0'
EOF
chmod +x "$pkgdir/usr/bin/lrcShow-X" 
}
