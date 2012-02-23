 # Contributor: Max Gonzih <iam AT gonzih DOT org>
 pkgname=shelr # All lowercase
 pkgver=0.9.10
 pkgrel=1
 pkgdesc="Shelr.tv client"
 arch=(any)
 url="http://shelr.tv"
 license=(GPLv3)
 depends=(ruby) # Gem may depend on other gems as well (you can get dependency information from the yaml specification)
 makedepends=(rubygems)
 source=(http://rubygems.org/downloads/shelr-$pkgver.gem)
 noextract=(shelr-$pkgver.gem)
 md5sums=(4694f2b718b3b81e16b2ac160c6eefbb)

 build() {
   cd $srcdir
   # _gemdir is defined inside build() because if ruby[gems] is not installed on the system
   #  makepkg will barf when sourcing the PKGBUILD
   local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

   gem install --no-user-install --ignore-dependencies --verbose -i "$pkgdir$_gemdir" -n "$pkgdir"/usr/bin shelr-$pkgver.gem
 }

 # vim:set ts=2 sw=2 et:
