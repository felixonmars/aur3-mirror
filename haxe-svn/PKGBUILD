# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=haxe-svn
pkgrel=1
pkgver=6530   
pkgdesc="A multiplatform open source programming language"
arch=('i686' 'x86_64')
url="http://code.google.com/p/haxe/"
license=('GPL2' 'MIT')
groups=('devel')
depends=('neko>=2.0.0' 'sh')
makedepends=('subversion' 'ocaml' 'sed' 'zlib' 'neko>=2.0.0')
provides=('haxe')
conflicts=('haxe')
options=('!strip' 'emptydirs' '!makeflags')
install=haxe.install
source=('haxeserver' 'haxe.sh' 'haxe.csh' "haxe::svn+http://haxe.googlecode.com/svn/trunk/")
md5sums=('888e2aa9e2583bc9888cc9889b24e3e7'
         'acf2d50add2ccc19cf4e84d14b4bb5f8'
         'b4263f4b8a2ed3308cdff93d01b70227'
         'SKIP')
_svnmod=haxe

pkgver() {
  cd "$SRCDEST"/haxe
  svnversion | tr -d [A-z]
}

build() {
  cd "$srcdir"
  
  msg "SVN checkout done or server timeout"
  msg "Starting build..."
  cd $srcdir/$_svnmod
  
  #
  # BUILD HERE
  #
  msg "Cleaning up..."
  make clean > /dev/null
  msg2 "done."
  
  msg "SVN HEAD revision is ${pkgver}. Starting build..."
  sed --in-place=.orig -e "s/\\(Haxe Compiler %d\.%d\.%d\\) -/\\1 [SVN r$pkgver] -/" main.ml 
  msg "Building libs..." && make libs || return 1
  msg2 "done."
  msg "Building haxe..." && make haxe || return 1
  msg2 "done."
#  msg "Building tools..." && make tools || return 1  
  msg "Building tools..." && env HAXE_STD_PATH=$srcdir/$_svnmod/std make tools || return 1
  msg2 "done."  
  msg "Generating api docs..."  
  cd $srcdir/$_svnmod/doc 
  rm -rf content *.xml
  env HAXE_STD_PATH=$srcdir/$_svnmod/std $srcdir/$_svnmod/haxe all.hxml
#  [ ! \( -f flash8.xml -a -f flash9.xml -a -f neko.xml -a -f js.xml -a -f php.xml -a -f cpp.xml -a -f java.xml -a -f cs.xml \) ] && return 1
  [ ! \( -f flash8.xml -a -f flash9.xml -a -f neko.xml -a -f js.xml -a -f php.xml -a -f cpp.xml \) ] && return 1
#  $srcdir/$_svnmod/std/tools/haxedoc/haxedoc -v "flash8.xml;flash8;flash" "neko.xml;neko" "js.xml;js" "flash9.xml;flash" "php.xml;php" "cpp.xml;cpp" "java.xml;java" "cs.xml;cs"
  $srcdir/$_svnmod/std/tools/haxedoc/haxedoc -v "flash8.xml;flash8;flash" "neko.xml;neko" "js.xml;js" "flash9.xml;flash" "php.xml;php" "cpp.xml;cpp"
  _res=$?
  if [ $_res -eq 0 ]; then _msg="done."; else _msg="failed."; fi
  echo && msg2 $_msg
  return $_res
}

package() {
  install --directory "$pkgdir"{/usr/{bin,lib/haxe/lib},/opt/haxe/doc,/etc/profile.d}
  install --mode=755 "$srcdir"/haxeserver "$pkgdir"/usr/bin/
  install --mode=755 "$srcdir"/haxe.{,c}sh "$pkgdir"/etc/profile.d/
  cp --recursive $srcdir/$_svnmod/std "$pkgdir"/opt/haxe/std
  install --mode=644 -D --no-target-directory $srcdir/$_svnmod/doc/LICENSE.txt "$pkgdir"/usr/share/${pkgname%-svn}/LICENSE.txt
  install --mode=644 $srcdir/$_svnmod/doc/CHANGES.txt "$pkgdir"/opt/haxe/
  install --mode=755 $srcdir/$_svnmod/haxe "$pkgdir"/usr/bin/
  cp --recursive $srcdir/$_svnmod/doc/content "$pkgdir"/opt/haxe/doc/
  install --mode=644 $srcdir/$_svnmod/doc/index.html "$pkgdir"/opt/haxe/doc/
  install --mode=755 $srcdir/$_svnmod/std/tools/haxelib/haxelib.sh "$pkgdir"/usr/bin/
  install --mode=755 $srcdir/$_svnmod/std/tools/haxedoc/haxedoc.sh "$pkgdir"/usr/bin/  
  cd "$pkgdir"/usr/bin 
  ln -sf haxelib.sh haxelib
  ln -sf haxedoc.sh haxedoc  
}

# vim:set ts=2 sw=2 et:
