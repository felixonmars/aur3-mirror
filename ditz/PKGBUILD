# Contributor: David Vilar <david.vilar@gmail.com>
# Contributor: BigZ (use ruby1.8)

pkgname=ditz
pkgver=0.5
pkgrel=2
pkgdesc="Simple, light-weight distributed issue tracker designed to work with distributed version control systems"
arch=(i686 x86_64)
url="http://ditz.rubyforge.org/"
license=('GPL')
depends=(ruby1.8)
source=(http://rubyforge.org/frs/download.php/41559/$pkgname-$pkgver.tgz)
md5sums=('324bdbef5b01f4d70288e9416fc8b952')
 
build() {
  cd "$srcdir/$pkgname-$pkgver"
 
  (echo "#!/usr/bin/ruby-1.8 -I/usr/lib/ditz"; tail -n+2 bin/ditz) > aaa
  mv aaa bin/ditz
  ruby-1.8 setup.rb config --prefix=$pkgdir/usr --siterubyver=$pkgdir/usr/lib/ditz
  ruby-1.8 setup.rb install || make 1
}
 
# vim:set ts=2 sw=2 et:
