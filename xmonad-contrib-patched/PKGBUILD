pkgname=xmonad-contrib-patched
_pkgname=xmonad-contrib
pkgver=0.11
pkgrel=1
pkgdesc="Extends functionality of xmonad-contrib through patching modules."
arch=('i686' 'x86_64')
url="https://github.com/isaacdomagalski/xmonad-contrib-patches"
license=('BSD')
depends=('ghc=7.6.3-1' 'sh' 'haskell-x11>=1.6.1.1-3' 'haskell-x11-xft>=0.3.1-9' 'haskell-utf8-string>=0.3.7-5' 'haskell-random>=1.0.1.1-5')
install='xmonad-contrib.install'
provides=('xmonad-contrib' 'haskell-xmonad-contrib')
conflicts=('xmonad-contrib' 'haskell-xmonad-contrib')
source=(http://hackage.haskell.org/packages/archive/$_pkgname/$pkgver/$_pkgname-$pkgver.tar.gz xmonad-contrib-remove-getatomname.patch xmonad-gridselect.patch)

build() {
  cd $srcdir/$_pkgname-$pkgver
  patch -Np1 -i $srcdir/xmonad-contrib-remove-getatomname.patch
  
  patch -Np1 -i $srcdir/xmonad-gridselect.patch

  runhaskell Setup.lhs configure --ghc --enable-shared --enable-split-objs --prefix=/usr -fuse_xft \
             --libsubdir=\$compiler/site-local/\$pkgid
  runhaskell Setup build
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  install -D -m744 register.sh $pkgdir/usr/share/haskell/$_pkgname/register.sh
  install -m744 unregister.sh $pkgdir/usr/share/haskell/$_pkgname/unregister.sh
  runhaskell Setup.lhs copy --destdir=$pkgdir
  install -D LICENSE $pkgdir/usr/share/licenses/xmonad-contrib/LICENSE
}
md5sums=('05fba258ac6063e49b50786a0869bd1f'
         '1d1fab94ae24b2a8f6a5dcd9cd6d9548'
         'SKIP')
