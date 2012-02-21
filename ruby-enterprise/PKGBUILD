# Contributor: Jeffrey Gelens <jgelens@gmail.com>
pkgname=ruby-enterprise
pkgver=1.8.7
_pkgver=2012.02
pkgrel=12
pkgdesc="Ruby Enterprise Edition is a drop-in, transparent solution for improving your Ruby on Rails website's scalability and performance, while decreasing memory usage."
arch=('i686' 'x86_64')
url="http://www.rubyenterpriseedition.com"
license=('GPL2')
depends=('openssl' 'zlib' 'readline')
provides=('ruby')
backup=()
source=(http://rubyenterpriseedition.googlecode.com/files/ruby-enterprise-$pkgver-$_pkgver.tar.gz http://google-perftools.googlecode.com/files/google-perftools-1.8.1.tar.gz)
install=$pkgname.install
md5sums=('8d086d2fe68a4c57ba76228e97fb3116'
         '6003e5a8f4bfa4409f5dc35ea7d4012d')

build() {
  cd "$srcdir/$pkgname-$pkgver-$_pkgver"
  pushd source/distro
  ln -sf ../../../google-perftools-1.8.1
  rm -Rf google-perftools-1.7
  popd
  sed --in-place 's/google-perftools-1.7/google-perftools-1.8.1/g' installer.rb source/distro/installer.rb

  cat << EOF | patch -p0 --unified --ignore-whitespace --verbose
--- source/ext/dl/mkcallback.rb.orig 2011-08-04 00:09:48.000000000 -0400
+++ source/ext/dl/mkcallback.rb 2011-08-04 00:10:11.000000000 -0400
@@ -52,5 +52,6 @@
 DLTYPE.keys.sort.each{|t|
   for n in 0..(MAX_CALLBACK - 1)
     print(mkfunc(t, n, 15), "\n\n")
+    STDOUT.flush
   end
 }
EOF

 cat << EOF | patch -p0
--- source/ext/dl/mkcbtable.rb.orig 2011-08-04 00:14:53.000000000 -0400
+++ source/ext/dl/mkcbtable.rb 2011-08-04 00:15:28.000000000 -0400
@@ -14,5 +14,6 @@
 DLTYPE.keys.sort.each{|t|
   for n in 0..(MAX_CALLBACK - 1)
     print(mktable(t, n, 15), "\n")
+    STDOUT.flush
   end
 }
EOF
#EOF
  ./installer -a /opt/ruby-enterprise --destdir=$pkgdir --dont-install-useful-gems
}
# vim:ts=2:sw=2:et
