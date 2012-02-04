# Contributor: Stunts <f.pinamartins@gmail.com> 
pkgname=raxml-standard-git
pkgver=20111008
pkgrel=2
pkgdesc="Randomized Axelerated Maximum Likelihood - standard version from git"
arch=(i686 x86_64)
url="https://github.com/stamatak/standard-RAxML"
license=('GPL2')

depends=()
optdepends=('openmpi: for buildin MPI capable binary')
makedepends=('git' 'make')
conflicts=('raxml' 'raxml-mpi')
source=()

#Check whether the CPU supports SSE3 instruction set:
if grep -q pni /proc/cpuinfo
then
    makefile=Makefile.SSE3
    extension=-SSE3
else
    makefile=Makefile
    extension=''
fi

_gitroot=git://github.com/stamatak/standard-RAxML.git
_gitname=standard-RAxML
_builddir=$srcdir/$_gitname-build

build() {
  cd $srcdir/
  msg "Connecting to github.com GIT server...."
  if [ -d $srcdir/$_gitname ] ; then
    pushd $_gitname && git pull origin && popd
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."
  rm -rf $_gitname-build
  
  git clone $_gitname $_gitname-build
  cd $_builddir
  
  #Build simple binary
  make -f $makefile.gcc
  rm *.o

  #Build MPI binary (if OpenMPI is available)
  if [ pacman -Q openmpi |grep -v error]
  then
      make -f $makefile.MPI.gcc
      rm *.o
      mpi=1
  else
      mpi=0
  fi

  #Build Pthreads binary
  make -f $makefile.PTHREADS.gcc
  rm *.o
}

package() {
  install -d $startdir/pkg/usr/bin 
  cp $_builddir/raxmlHPC$extension $startdir/pkg/usr/bin/raxml
  cp $_builddir/raxmlHPC-PTHREADS$extension $startdir/pkg/usr/bin/raxml-PTHREADS
  if [ $mpi ]
  then
      cp $_builddir/raxmlHPC-MPI$extension $startdir/pkg/usr/bin/raxml-MPI
  fi
}
