# $Id$
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgbase=rubinius
pkgname=rubinius
true && pkgname=(rubinius rubinius-ruby)
pkgver=2.0.0
pkgrel=1
pkgdesc="An implementation of Ruby designed for concurrency"
arch=(i686 x86_64)
url="http://rubini.us"
license=(custom)
depends=(llvm-libs libffi openssl libyaml)
makedepends=(llvm ruby git)
options=(!emptydirs)
source=(http://releases.rubini.us/${pkgbase}-${pkgver}.tar.bz2
        gemrc)
sha256sums=('df039c7c52e9e42a2f3e0d0b67bf2c9b255769d1f8c3bac2333469ca8c0e04c4'
            '4bb7eb2fe66e396ed16b589cdb656831407b39ad4e138d88536754c0448ac614')

_env() {
  export GEM_HOME="$srcdir/gemdir"
  export BUNDLE="$GEM_HOME/bin/bundle"
}

# Set up build environment (needs access to rubygems.org)
prepare() {
  _env

  mkdir -p "$GEM_HOME"
  gem install --no-user-install -N bundler
  cd $pkgbase-$pkgver
  "$BUNDLE" install
}

build() {
  _env
  cd $pkgbase-$pkgver
  ./configure --prefix=/usr \
    --mandir=/usr/share/man \
    --includedir=/usr/include/rubinius \
    --appdir=/usr/lib/rubinius \
    --gemsdir=/usr/lib/rubinius/gems \
    --preserve-prefix \
    --llvm-shared
  rake build
}

check() {
  cd $pkgbase-$pkgver
  rake vm:test || :
}

package_rubinius() {
  optdepends=('rubinius-docs: Rubinius documentation'
              'ruby-docs: Ruby documentation')

  cd $pkgbase-$pkgver
  DESTDIR="$pkgdir" rake install

  mkdir -p "$pkgdir/usr/share/ri"
  ln -s 2.0.0 "$pkgdir/usr/share/ri/2.1"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/rubinius/LICENSE"

### Split rubinius-ruby
  mkdir -p "$srcdir/ruby/usr/bin"
  for _f in "$pkgdir"/usr/bin/*; do
    [[ $_f == */rbx ]] && continue
    mv $_f "$srcdir/ruby/usr/bin"
  done
}

package_rubinius-ruby() {
  pkgdesc="Ruby compat for Rubinius"
  depends=(rubinius)
  provides=(ruby)
  conflicts=(ruby)
  backup=(etc/gemrc)

  mv ruby/* "$pkgdir"
  install -Dm644 gemrc "$pkgdir/etc/gemrc"
  install -Dm644 $pkgbase-$pkgver/LICENSE "$pkgdir/usr/share/licenses/rubinius-ruby/LICENSE"
}
