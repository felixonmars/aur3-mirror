# Contributor: Eric Forgeot < http://ifiction.free.fr >
# Maintainer: Sean Bartell <wingedtachikoma@gmail.com>
_gemname=ifmapper
pkgname=ifmapper
pkgver=1.1.6
pkgrel=1
pkgdesc="WYSIWYG mapping utility for interactive fiction"
arch=(any)
url="http://ifmapper.rubyforge.org/"
license=('GPL')
depends=(ruby fxruby)
makedepends=(rubygems)
source=(http://rubyforge.org/frs/download.php/76293/$_gemname-$pkgver.gem ifmapper.desktop)
noextract=($_gemname-$pkgver.gem)
md5sums=('3c7e7119ca24366f4b27b702c6827f77'
         'e8f3df5767d8c7949cccb8c0aa53a541')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

  install -d -m755 "$pkgdir/usr/bin/"
  cat >"$pkgdir/usr/bin/IFMapper" <<EOF
#!/bin/sh
exec /usr/bin/ruby "$_gemdir/gems/$_gemname-$pkgver/IFMapper.rbw" \$@
EOF
  chmod +x "$pkgdir/usr/bin/IFMapper"
  install -D -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
