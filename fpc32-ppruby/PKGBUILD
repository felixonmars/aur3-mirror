pkgname=fpc32-ppruby
pkgver=20121025
pkgrel=1
pkgdesc="Ruby binding units for FreePascal (multilib)"
url="https://github.com/shikhalev/ppruby"
license=("GPLv3")
arch=(x86_64)
depends=(fpc lazarus)
makedepends=(fpc-multilib git lazarus)
_gitroot="https://github.com/shikhalev/ppruby.git"
_gitname=ppruby
_unittgt=i386-linux
_fpcvers=`fpc -iV`

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]
  then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."
  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  
  for file in `ls *.lpk`
  do
    lazbuild --compiler=/usr/bin/ppcross386 --cpu=i386 --os=linux $file
  done
  cd static
  ppcross386 -Tlinux ruby18.pp
}

package() {
  cd "$srcdir/$_gitname-build/lib"
  find . -name '*.o' -o -name '*.ppu' -o -name '*.rst' -o -name '*.a' -o -name '*.compiled' |
    xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/lib/fpc/$_fpcver/units/$_unittgt/"{}
  cd "../static"
  find . -name '*.o' -o -name '*.ppu' -o -name '*.rst' -o -name '*.a' -o -name '*.compiled' |
    xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/lib/fpc/$_fpcver/units/$_unittgt/"{}
}