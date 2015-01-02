# Maintainer: Thomas Gubler <thomasgubler@gmail.com>
_libname=flightplot
pkgname=java-${_libname}-git
pkgver=20150101
pkgrel=1
pkgdesc="PX4/APM flight log plotter"
arch=(any)
url="https://pixhawk.org/dev/flightplot"
license=('unknown')
depends=('java-runtime')
makedepends=('apache-ant')
optdepends=()
provides=('java-flightplot')
conflicts=('java-flightplot')
options=(!emptydirs)
md5sums=('SKIP')

_gitroot="https://github.com/DrTon/FlightPlot.git"
_gitname="FlightPlot"
source=(git+$_gitroot)

prepare() {
  cd "$srcdir/$_gitname"
  git submodule init
  git submodule update
}

build() {
  cd "$srcdir/$_gitname"
  ant flightplot

  printf "#!/bin/sh\nexec /usr/bin/java -jar '/usr/share/java/${_libname}/flightplot.jar' '$@'" > archlinux_start_script
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm755 out/production/flightplot.jar ${pkgdir}/usr/share/java/${_libname}/${_libname}.jar
  install -Dm755 archlinux_start_script ${pkgdir}/usr/bin/${_libname}
}

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
