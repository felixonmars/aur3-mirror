 # Maintainer: Mike Toupin <miketoupin952@gmail.com>  based on the original PKGbuild from ManU
 
 # You have to register at unrealengine.com and in this profile you have to enter your github accountname, so that epicgames grants you access to the repository, otherwise makepkg will fail.
 
pkgbase=ue4-epic-git
pkgver=4.7
pkgrel=1
arch=('x86_64')
url="https://www.unrealengine.com/"
license=('custom')
groups=()
depends=('qt5-base' 'sdl2' 'xorg-server' 'libpng' 'harfbuzz' 'graphite' 'xdg-user-dirs')
makedepends=('git' 'mono' 'clang35' 'dos2unix' 'cmake' 'python' 'qt5-base' 'sdl2')
#replaces=()
backup=()
#options=('staticlibs' 'libtool')
install=
changelog=
source=("${pkgbase}::git+https://github.com/EpicGames/UnrealEngine"
        'clean_method.txt'
        'CMakeLists.patch'
        'ue4.sh'
        'ue4-git.install')
noextract=()
md5sums=('SKIP'
            '53942060733c2925c7ddc5e3d6f51e05'
            '8c2df0d8fe7861da6cdb3b93c81b1e29'
            '21feb6b600bb5ef357ba4d004a26cad9'
            'e8cec0ea47c60b6a339eec19fdca9d4e') #autofill using updpkgsums
 
pkgver() {
  cd "$srcdir/$pkgbase"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
 
prepare() {
  echo "You will need at least 20 GB of free disk space and a relatively powerful machine!"
  echo ""
  cd "$srcdir/$pkgbase/Engine/Source/ThirdParty/LinuxNativeDialogs/UELinuxNativeDialogs"
  patch < "../../../../../../CMakeLists.patch"
  cd "$srcdir/$pkgbase"
  ./Setup.sh
  cd "$srcdir/$pkgbase"
  ./GenerateProjectFiles.sh
  sed -i "/GenerateProjectFiles.sh/r ${srcdir}/clean_method.txt" 'Makefile'
  echo ""
  echo "clang-bug, workaround: execute the following command:"
  echo ">$ mkdir ~/bin/ && cd ~/bin/ && ln -s /bin/ld.bfd ./ld.gold"
  echo ""
  echo "Add the following line to your .bashrc (or .zshrc if you use zsh) usually found in the home folder (hidden):"
  echo 'export PATH=$HOME/bin:$PATH'
  echo "press ENTER to continue"
  read
  echo ""
}
 
build() {
  cd "$srcdir/$pkgbase"
  make ShaderCompileWorker UnrealLightmass UnrealPak UE4Editor
}
 
_package() {
  pkgdesc="UnrealEngine 4 is a suite of integrated tools for game developers to design and build games, simulations, and visualizations."
  optdepends=( 'kdevelop')
  provides=('ue4-epic-git')
  conflicts=('ue4-git')
 
 cd "$srcdir/$pkgbase"
  install -d -m755 -o root -g root "$pkgdir/opt/$pkgbase"
  cp -r Engine $pkgdir/opt/$pkgbase/
  rm -rf $pkgdir/opt/$pkgbase/Engine/Source
  rm -rf $pkgdir/opt/$pkgbase/Engine/Intermediate
  rm -rf $pkgdir/opt/$pkgbase/Engine/DerivedDataCache
  cp -r FeaturePacks $pkgdir/opt/$pkgbase/
  cp -r Templates $pkgdir/opt/$pkgbase/
  chown -R root:users -R $pkgdir/opt/$pkgbase/Engine/Programs/*
  install -D -m755 -o root -g root $srcdir/ue4.sh "${pkgdir}/usr/bin/ue4.sh"
  install -D -m644 LICENSE.pdf -o root -g root "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE.pdf"
  install -d -m755 -o root -g users "$pkgdir/opt/$pkgbase/Engine/Intermediate"
  chmod 775 $pkgdir/opt/$pkgbase/Engine/Intermediate
  install -d -m775 -o root -g users "$pkgdir/opt/$pkgbase/Engine/DerivedDataCache"
  chown -R root:users $pkgdir/opt/$pkgbase/Engine/Saved
  chmod 775 $pkgdir/opt/$pkgbase/Engine/Saved/
  cd $pkgdir/opt/$pkgbase/Engine/Binaries/Linux
  #make DESTDIR="$pkgdir/opt/$pkgbase/" install
}
_package-src(){
  pkgdesc="Source for UnrealEngine 4 to create C++ scripts"
  provides=("${pkgbase}-src=${pkgver}")
  conflicts=("${pkgbase}-src")
  replaces=("${pkgbase}-src")
 
  cd "$srcdir/$pkgbase"
  mkdir -p "${pkgdir}/opt/${pkgbase}/Engine"
  cp -r Engine/Source $pkgdir/opt/$pkgbase/Engine
}
 
pkgname=("${pkgbase}" "${pkgbase}-src")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done
