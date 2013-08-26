# Maintainer: X0rg

pkgname=lib32-gnustep-make-clang-svn
_svnname=gnustep-make
pkgver=37018
pkgrel=1
pkgdesc="The GNUstep make package, using Clang (32-bit)"
arch=('x86_64')
url="http://www.gnustep.org/"
license=('GPL3')
groups=('lib32-gnustep-clang-svn')
depends=('lib32-libffi' 'gnustep-make-clang-svn')
makedepends=('svn' 'clang' 'gcc-multilib' 'lib32-llvm')
install=lib32-gnustep-make-clang.install
options=('!emptydirs' 'purge')
source=("$_svnname::svn://svn.gna.org/svn/gnustep/tools/make/trunk/"
	'arch')
md5sums=('SKIP'
         '847a0b2a527a380af39567ec9ebc0c36')

pkgver() {
  cd $_svnname
  svnversion | tr -d [A-z]
}

prepare() {
  cd $_svnname

  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Change l'emplacement par défaut des bibliothèques de GNUstep-Clang dans le fichier '/opt/GNUstep32/etc/GNUstep/GNUstep.conf'..."
  else
    msg2 "Change the default path of GNUstep libraries in '/etc/GNUstep/GNUstep.conf' file..."
  fi
  cp "$srcdir/arch" "./FilesystemLayouts/"
}

build() {
  cd $_svnname

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export LLVM_CONFIG="/usr/bin/llvm-config32"

  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Exécute 'configure'..."
  else
    msg2 "Run 'configure'..."
  fi
  CC="clang -m32" CXX="clang++ -m32" ./configure --with-layout=arch --sysconfdir=/opt/GNUstep32/etc --prefix=/opt/GNUstep32 --libexecdir=/usr/lib32 --libdir=/usr/lib32
}

package() {
  cd $_svnname
  make DESTDIR=$pkgdir install

  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Installe le fichier '/etc/profile.d/GNUstep32.sh'..."
  else
    msg2 "Install '/etc/profile.d/GNUstep32.sh' file..."
  fi
  install -v -D -m755 $pkgdir/opt/GNUstep32/share/GNUstep/Makefiles/GNUstep.sh $pkgdir/etc/profile.d/GNUstep32.sh

  PURGE_TARGETS=(*.gz)
}
