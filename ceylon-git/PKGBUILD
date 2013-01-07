# Maintainer: TDY <tdy.aur@gmail.com>

pkgname=ceylon-git
pkgver=20130102
pkgrel=1
pkgdesc="A powerful statically typed language for writing large programs in groups"
arch=('any')
url="http://ceylon-lang.org/"
license=('Apache' 'GPL' 'LGPL')
depends=('java-environment>=7')
makedepends=('apache-ant>=1.8' 'git')
optdepends=('nodejs: for JavaScript interoperability')
provides=('ceylon')
conflicts=('ceylon')
install=ceylon.install

_gitroot=https://github.com/ceylon/ceylon-dist.git
_gitname=ceylon-dist

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]]; then
    (cd $_gitname && git pull origin)
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd $_gitname-build

  sed -i 's|git@\(github.com\):|https://\1/|; s|copy-licenses,||; /.bat/d' build.xml
  ant setup
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm644 NOTICE "$pkgdir/usr/share/licenses/${pkgname%-*}/NOTICE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-*}/README.md"

  # dist
  ant publish-all \
    -Dceylon.repo.dir="$pkgdir/usr/share/java/${pkgname%-*}/repo" \
    -Ddist.dir="$pkgdir/usr/share/java/${pkgname%-*}"

  # bin
  install -dm755 "$pkgdir/usr/bin/"
  ln -s /usr/share/java/${pkgname%-*}/bin/${pkgname%-*} "$pkgdir/usr/bin/${pkgname%-*}"

  # runtime
  cp -a ../${pkgname%-*}-runtime/dist/repo "$pkgdir/usr/share/java/${pkgname%-*}"
  find "$pkgdir/usr/share/java/${pkgname%-*}/repo" -type f -exec chmod 644 '{}' \;
  find "$pkgdir/usr/share/java/${pkgname%-*}/repo" -type d -exec chmod 755 '{}' \;
}

# vim:set ts=2 sw=2 et:
