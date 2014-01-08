# $Id$
# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid

pkgname=rightlink
pkgver=5.9.5
pkgrel=1
pkgdesc='RightScale RightLink cloud instance agent.'
arch=('i686' 'x86_64' 'armv6h')
url=https://github.com/rightscale/right_link
license=(MIT RUBY)
makedepends=(autoconf git tar patch)
conflicts=(rightscale-deb)
options=(emptydirs strip !docs !libtool !staticlibs)

_srcname="right_link"
_rl_prefix="opt/rightscale"

source=(
  https://github.com/rightscale/right_link/archive/v$pkgver.tar.gz
  system_configurator.rb.patch
  server_importer.rb.patch
)
	
md5sums=('c47e01e1096841e85d95c148819530f9'
         'ea36f42257352c44f5240ed67e36f4fb'                                                                                          
         'e47fadba0866d2773ba9d2cc124e112e')

package() {
  mkdir -p "$pkgdir/$_rl_prefix/$_srcname"
  cp -R "$srcdir/$_srcname-$pkgver/actors" "$pkgdir/$_rl_prefix/$_srcname/"
  cp -R "$srcdir/$_srcname-$pkgver/bin" "$pkgdir/$_rl_prefix/$_srcname/"
  cp -R "$srcdir/$_srcname-$pkgver/ext" "$pkgdir/$_rl_prefix/$_srcname/"
  cp -R "$srcdir/$_srcname-$pkgver/init" "$pkgdir/$_rl_prefix/$_srcname/"
  cp -R "$srcdir/$_srcname-$pkgver/lib" "$pkgdir/$_rl_prefix/$_srcname/"  
  cp -R "$srcdir/$_srcname-$pkgver/scripts" "$pkgdir/$_rl_prefix/$_srcname/"  
  cp -R "$srcdir/$_srcname-$pkgver/spec" "$pkgdir/$_rl_prefix/$_srcname/"  

  pushd "$pkgdir"
  	msg "Applying patch for system_configurator.rb..."
  	patch -p0 < "$startdir/system_configurator.rb.patch"

  	msg "Applying patch for server_importer.rb..."
  	patch -p0 -R --no-backup-if-mismatch < "$startdir/server_importer.rb.patch"
  popd

  msg 'Adding share docs to package.'
	install -D "$srcdir/$_srcname-$pkgver/LICENSE" "$pkgdir/usr/share/$pkgname/LICENSE"
	install -D "$srcdir/$_srcname-$pkgver/INSTALL.rdoc" "$pkgdir/usr/share/$pkgname/INSTALL.rdoc"
	install -D "$srcdir/$_srcname-$pkgver/README.rdoc" "$pkgdir/usr/share/$pkgname/README.rdoc"
	install -D "$srcdir/$_srcname-$pkgver/RELEASES.rdoc" "$pkgdir/usr/share/$pkgname/RELEASES.rdoc"
}

# vim:syntax=sh