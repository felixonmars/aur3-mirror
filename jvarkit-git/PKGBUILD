# Maintainer: Mike Dacre <mike@dacre.me>
pkgname=jvarkit-git 
pkgver=r426.6dd9f22
pkgrel=1
pkgdesc="Java utilities for Next Generation Sequencing"
arch=('any')
url="https://github.com/lindenb/jvarkit"
license=('MIT')
depends=('apache-ant' 'java-environment=7' 'python' 'htsjdk-git')
makedepends=('git')
optdepends=('java-berkeleydb: Some tools require BerkeleyDB bindings'
            'mysql-connector-java: Some tools require mysql bindings'
            'bigwig-java-snv: Some tools require BigWig')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

install=jvarkit.install

source=('jvarkit::git+https://github.com/lindenb/jvarkit'
        'jvarkit-install.py')

md5sums=('SKIP'
         '6bd9dcb800f32390c5fe12e4fc446c6d')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  if [ -e htsjdk/dist ]; then
    rm htsjdk/dist
  fi
  ln -s /usr/share/java/htsjdk htsjdk/dist
}

package() {
  mkdir -p "$pkgdir/usr/share/java"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/licenses/jvarkit-git"
  install -m755 "$srcdir/jvarkit-install.py" "$pkgdir/usr/bin/"
  install -m644 "$srcdir/${pkgname%-git}/LICENSE.txt" "$pkgdir/usr/share/licenses/jvarkit-git" 
  cp -r "$srcdir/${pkgname%-git}" "$pkgdir/usr/share/jvarkit"
  rm -rf "$pkgdir/usr/share/jvarkit/.git"
  mkdir "$pkgdir/usr/share/jvarkit/dist"
  cd "$pkgdir/usr/share/java/"
  ln -s ../jvarkit/dist jvarkit 
}
