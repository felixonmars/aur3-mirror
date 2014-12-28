# Maintainer: Vincent Demeester <vincent@sbr.pm>
pkgname=jenv
pkgver=0.4.2
pkgrel=1
pkgdesc="Manage your Java environment"
arch=('any')
url="https://github.com/gcuisinier/jenv"
license=('BSD')
depends=()
conflicts=('jenv-git')
install="jenv.install"
source=("${url}/tarball/${pkgver}")
noextract=("${pkgver}")
md5sums=('7e06776a729a778e0ce1cb084da5196f')

build() {
    cd $srcdir

    tar -x --strip-components 1 -zf "$pkgver"
}

package() {
  cd $srcdir

  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  mkdir -p $pkgdir/usr/lib/jenv/completions
  mkdir -p $pkgdir/usr/lib/jenv/libexec

  install -m 644 ./README.md $pkgdir/usr/share/doc/$pkgname
  install -m 644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname
  install -m 644 ./completions/* $pkgdir/usr/lib/jenv/completions/
  install -m 755 ./libexec/* $pkgdir/usr/lib/jenv/libexec/

  ln -s /usr/lib/jenv/libexec/jenv $pkgdir/usr/bin/
}

