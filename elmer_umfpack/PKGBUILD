# Contributor: Christoph Siegenthaler < csi@gmx.ch >
# Contributor: Thomas Dziedzic

pkgname=elmer_umfpack
pkgver=20141218.8eaded3
pkgrel=1
pkgdesc='Elmer is a simulation tool for CFD, FEM, electromagnetics, heat transfer and others featuring a PDE solver.'
license=('unknown')
arch=('i686' 'x86_64')
makedepends=('gcc-fortran' 'openmpi' 'blas' 'lapack')
url='http://www.csc.fi/elmer/'
md5sums=()
_gitroot="https://github.com/ElmerCSC/elmerfem"
_gitname="elmerfem"

pkgver() {
  if [ -d "$srcdir"/$_gitname ]; then
    cd "$srcdir"/$_gitname
    #git describe --always | sed 's|-|.|g'
    #echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
     (git log -1 --format='%cd.%h' --date=short | tr -d -)
  fi
}

build() {
  #cd trunk/umfpack
     cpucount=$(grep -c processor /proc/cpuinfo 2>/dev/null)
  jc=$((${cpucount:-1}))
   
   cd "$srcdir"
    msg "Connecting to the GIT server...."
    if [[ -d "$_gitname" ]]; then
        cd "$_gitname" && git pull origin && cd "$srcdir"
        msg "The local files are updated."
    else
        git clone "$_gitroot" "$_gitname"
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting build..."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$_gitname" "$_gitname-build"
    cd "$_gitname-build"
  export FC=gfortran
  export F77=gfortran
  cmake -DCMAKE_BUILD_TYPE=debugfull \
		-DCMAKE_INSTALL_PREFIX=/opt/elmer
  make || return 1

}

package() {
        cd "$_gitname-build"
	mkdir -p "$pkgdir/opt/elmer"
	make DESTDIR="$pkgdir" install || return 1
}