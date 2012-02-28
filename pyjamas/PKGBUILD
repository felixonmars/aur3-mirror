# Maintainer: C Anthony Risinger <anthony.xtfx.me>

pkgname=pyjamas
pkgver=0.8
_pkgver=alpha1
pkgrel=1
pkgdesc='Widget API for Web applications, in Python'
arch=('any')
url='http://pyjs.org'
license=('APACHE')
depends=('python2')
makedepends=('python2' 'python2-distribute')

source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}${_pkgver}.tar.bz2)
md5sums=('a5c0bb095c1a1829c72986cfe7c79f24')


build() {
  # Conforming to $srcdir/INSTALL.txt
  cd ${pkgname}-${pkgver}${_pkgver}
  python2 bootstrap.py /usr/share/pyshared /usr/share/pyjamas .
  python2 run_bootstrap_first_then_setup.py build
  python2 run_bootstrap_first_then_setup.py install --root=$pkgdir || return 1

  msg "patching examples"
  sed -i -e's/..\/..\/bin\///' $pkgdir/usr/share/pyjamas/examples/*/build.sh || return 1

  msg "installing pjsbuild"
  mkdir -p $pkgdir/usr/bin
  install -m 755 bin/pyjsbuild $pkgdir/usr/bin/ || return 1
  mkdir -p $pkgdir/usr/share/man/man1
  install -m 644 pyjs/src/pyjs/pyjsbuild.1 $pkgdir/usr/share/man/man1 || return 1
}

