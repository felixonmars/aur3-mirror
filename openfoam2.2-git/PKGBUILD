# Original Contributor: aquavitae <aquavitae69: gmail>
# Current Maintainer: Andrew Fischer <andrew_at_ltengsoft.com>

pkgname=openfoam2.2-git

# The distributors package name
_distpkgname=OpenFOAM
_distpkgver=2.2.x
_gitname=$_distpkgname-$_distpkgver
pkgver=545ea993
pkgrel=1
pkgdesc="The open source CFD toolbox"
arch=('i686' 'x86_64')
url="http://www.openfoam.com"
license=('GPL')
groups=()
depends=('paraview' 'parmetis' 'ptscotch-openmpi' 'boost')
makedepends=('git')
optdepends=()
provides=('openfoam')
conflicts=('openfoam')
replaces=()
backup=()
options=()
source=(git+https://github.com/OpenFOAM/OpenFOAM-2.2.x.git
  decomp-options.patch
  paraFoam.patch
  scotch-options.patch
)
noextract=()
install=openfoam.install

md5sums=('SKIP'
  09fab2596762070f37fb9faca72c4885
  11724ab89a0736df4db5f2be4636eab8
  8f68dfdc134f5e6acd582a3d4c41e86d
)

pkgver() {
  cd $_gitname
  git describe --always
}

build() {
  # Extract the current version and major of paraview and of scotch for use in the system preferences
  _pversion=`pacman -Q paraview | sed -e 's/.* //; s/-.*//g'`
  _pmajor=`echo $_pversion | cut -d '.' -f1`
  _sversion=`pacman -Q ptscotch-openmpi | sed -e 's/.* //; s/-.*//g'`

  # Generate and install the system preferences file
  echo "compilerInstall=system" > $startdir/prefs.sh
  echo "export WM_MPLIB=SYSTEMOPENMPI" >> $startdir/prefs.sh
  echo "export ParaView_VERSION=$_pversion" >> $startdir/prefs.sh
  echo "export ParaView_MAJOR=$_pmajor" >> $startdir/prefs.sh
  cp $startdir/prefs.sh $srcdir/$_gitname/etc || return 1

  # Generate the scotch.sh file for arch
  echo "export SCOTCH_VERSION=scotch_$_sversion" > $startdir/scotch.sh
  echo "export SCOTCH_ARCH_PATH=/usr" >> $startdir/scotch.sh
  cp $startdir/scotch.sh $srcdir/$_gitname/etc/config || return 1

  # Patch for archlinux parmetis, paraview and openmpi paths, and ptscotch link lines
  patch -p1 < $startdir/decomp-options.patch
  patch -p1 < $startdir/paraFoam.patch
  patch -p1 < $startdir/scotch-options.patch

  # Setup the build environment
  export FOAM_INST_DIR=$srcdir 
  foamDotFile=$srcdir/$_gitname/etc/bashrc
  [ -f $foamDotFile ] && . $foamDotFile || return 1

  # Enter build directory
  cd "$srcdir/$_gitname" || return 1

  # Build and clean up OpenFOAM
  ./Allwmake || return 1
  wclean all || return 1
  wmakeLnIncludeAll || return 1

}
package() {
  cd "$startdir"

  # Create destination directories
  install -d "$pkgdir/opt/$_distpkgname" "$pkgdir/etc/profile.d" || return 1

  # Move package to pkgdir
  mv "$srcdir/$_gitname" "$pkgdir/opt/$_distpkgname/$_gitname" || return 1

  # Add source file
  echo "export FOAM_INST_DIR=/opt/$_distpkgname" > "$pkgdir/etc/profile.d/openfoam.sh" || return 1
  echo "source \$FOAM_INST_DIR/$_gitname/etc/bashrc" >> "$pkgdir/etc/profile.d/openfoam.sh" || return 1

  # Add stub thirdparty directory to keep openfoam happy
  install -d "$pkgdir/opt/$_distpkgname/ThirdParty-$_distpkgver" || return 1

  # Permission fixes - for system-wide install and use
  chmod -R go+r "$pkgdir/opt"
  chmod -R 755 "$pkgdir/opt/$_distpkgname/$_gitname/bin"
  chmod -R 755 "$pkgdir/opt/$_distpkgname/$_gitname/etc"
}



