# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid

_gemname=redcar
pkgname=$_gemname
pkgver=0.13
pkgrel=4
pkgdesc="A cross-platform programmer's editor written in Ruby."
arch=(any)
url='http://redcareditor.com/'
license=('GPL2')
depends=(ruby ruby-bouncy-castle-java ruby-bundler ruby-git ruby-jruby-openssl ruby-lucene ruby-net-ftp-list ruby-net-sftp ruby-net-ssh ruby-plugin_manager ruby-redcar-bundles ruby-redcar-icons ruby-redcar-javamateview ruby-redcar-jruby ruby-redcar-svnkit ruby-ruby-blockcache ruby-spoon ruby-swt redcar-application-icons)
makedepends=(ruby)
noextract=($_gemname-$pkgver.gem)
conflices=(ruby-redcar ruby-redcar-git)

source=(
  http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem
  redcar.desktop
)

md5sums=('30778c195d298cf4c9da5e3370121fe3'
         '9fd178f6516d262fa35dd86b70f8c4d1')

package() {
  cd "$srcdir"

  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"

  msg 'Install .desktop entry.'
  install -Dm644 "$srcdir/redcar.desktop" "$pkgdir/usr/share/applications/redcar.desktop"
}

# vim:set ts=2 sw=2 et:
