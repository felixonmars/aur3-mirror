# Maintainer: Tom Bebbington <tophattedcoder@gmail.com>
# Contributor: Mario Rodas <rodasmario2@gmail.com>
 
pkgname=higgs-git
_gitname=higgs
pkgver=r735.9f83432
pkgrel=1
pkgdesc="An interpreter and JIT compiler for JavaScript targetting x86-64 platforms."
arch=('x86_64')
url="https://github.com/maximecb/Higgs"
license=('custom:"Copyright M Chevalier-Boisvert"')
groups=('devel')
makedepends=('dmd' 'libphobos-devel' 'glibc')
options=('!strip' 'emptydirs' '!makeflags')
source=("LICENSE" "$_gitname::git+https://github.com/maximecb/Higgs.git")
md5sums=('0bae9d479c77861fe7f1ec872f242a3e' 'SKIP')
 
pkgver() {
cd "$srcdir/$_gitname"
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
 
# We use /etc/higgs as LIB_DIR
# See: https://github.com/maximecb/Higgs/issues/52
 
build() {
cd $srcdir/$_gitname/source
sed -i "s:python\b:python2:g" makefile
make BIN_DIR=$pkgdir/usr/bin LIB_DIR=$pkgdir/etc/higgs all
}
 
package() {
cd "$srcdir/$_gitname/source"
install -d "$pkgdir/usr/bin"
install -d "$pkgdir/etc/higgs"
install -D -m644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
make BIN_DIR=$pkgdir/usr/bin LIB_DIR=$pkgdir/etc/higgs install
}
