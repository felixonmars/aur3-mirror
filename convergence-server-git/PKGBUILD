# Maintainer: mutantmonkey <mutantmonkey@mutantmonkey.in>
pkgname=convergence-server-git
pkgver=20111110
pkgrel=1
pkgdesc="An agile, distributed, and secure strategy for replacing Certificate Authorities (notary server)"
arch=('any')
url="http://convergence.io"
license=('GPL')
depends=('python2' 'python-m2crypto' 'twisted' 'python2-pyopenssl')
makedepends=('git')
provides=('convergence-server')
conflicts=('convergence-server')
backup=('etc/conf.d/convergence.conf')
install='convergence-server.install'
source=('convergence.conf' 'rc.convergence')
md5sums=('6ebda9a22cc9c283673ef3a26768a6a3'
         '6d4c1d5dbd26646a83cbd46830cd0755')
sha256sums=('9beb9b5ad903e120df8fbaae6ad8bf87aab8d7d75336d605c0fd53dcd6fd5360'
            'd185d293beae29a97454f160db0f4b0f6d1862b899786b1858703619b0392244')

_gitroot=https://github.com/moxie0/Convergence.git
_gitname=convergence

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build/server"

  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname-build/server"
  python2 setup.py install --root="$pkgdir/"
  rm -rf "$pkgdir/etc"
  install -D -m 644 "$srcdir/convergence.conf" "$pkgdir/etc/conf.d/convergence.conf"
  install -D -m 755 "$srcdir/rc.convergence" "$pkgdir/etc/rc.d/convergence"
}

# vim:set ts=2 sw=2 et:
