# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=vmkit-svn
pkgver=20110702
pkgrel=1
pkgdesc="A Java VM based on the LLVM virtual machine"
arch=('i686' 'x86_64')
license=('LLVM')
url="http://vmkit.llvm.org/index.html"
depends=('clang' 'classpath')

build() {
cd $srcdir
export CC=clang
export CXX=clang++

msg "checking out an LLVM source tree"
# Update the repo, else clone a new one
	if [ -d llvm ]; then
		cd llvm
		svn up
		cd $srcdir
	else
		svn co http://llvm.org/svn/llvm-project/llvm/trunk llvm
		cd $srcdir/llvm
		./configure; make
		cd $srcdir
	fi

msg "checking out VMKit"
# Update the repo, else clone a new one
	if [ -d vmkit ]; then
		cd vmkit
		svn up
		cd $srcdir
	else
		svn co http://llvm.org/svn/llvm-project/vmkit/trunk vmkit
	fi

msg "building VMKit"
     cd $srcdir/vmkit
      ./configure \
      --with-llvmsrc=$srcdir/llvm \
      --with-llvmobj=$srcdir/llvm \
      --with-gnu-classpath-glibj=/usr/share/classpath/glibj.zip
   
      make
}

package() {
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/licenses/vmkit
    cd $srcdir/vmkit
    make install exec_prefix=$pkgdir/usr datarootdir=$pkgdir/usr prefix=$pkgdir/usr
    install -m644 $srcdir/vmkit/LICENSE.TXT $pkgdir/usr/share/licenses/vmkit/
}