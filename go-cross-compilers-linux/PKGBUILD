# $Id$
# Maintainer: Joshua Marsh <joshua@themarshians.com>

pkgname=go-cross-compilers-linux
pkgver=1.0.3
pkgrel=1
pkgdesc='Additional tools for compiling to non-native linux architectures with Google Go'
arch=('x86_64' 'i686')
url='http://golang.org/'
license=('custom')
depends=('go')
makedepends=('inetutils')
options=('!strip' '!emptydirs')
source=("http://go.googlecode.com/files/go$pkgver.src.tar.gz")
sha256sums=('7fba3533d172f13629d3d8a79e57c620632b0bd075abe11d7698b338be0ae3df')

build() {
  cd $srcdir/go/src

	# We use these for building the binaries.
	export GOBIN=$pkgdir/go/bin
	export GOROOT_FINAL=/usr/lib/go

	# cgo doesn't work with cross compilations.
	export CGO_ENABLED=0
	export GOOS=linux

	# This is the list of architectures that we'll build
	osarch=()

  if [ "$CARCH" == 'x86_64' ]; then
			export GOARCH=386
  elif [ "$CARCH" == 'i686' ]; then
			export GOARCH=amd64
  fi
	
	bash make.bash --no-clean

}

package() {
  cd $srcdir/go

	# The go license
	install -Dm644 LICENSE \
			$pkgdir/usr/share/licenses/${pkgname}/LICENSE

	# Remove the files go installed that we don't need
	rm $pkgdir/go/bin/godoc
	rm $pkgdir/go/bin/gofmt
	rm $pkgdir/go/bin/go
  if [ "$CARCH" == 'x86_64' ]; then
			rm $pkgdir/go/bin/linux_386/godoc
			rm $pkgdir/go/bin/linux_386/gofmt
			rm $pkgdir/go/bin/linux_386/go
			rmdir $pkgdir/go/bin/linux_386
  elif [ "$CARCH" == 'i686' ]; then
			rm $pkgdir/go/bin/linux_amd64/godoc
			rm $pkgdir/go/bin/linux_amd64/gofmt
			rm $pkgdir/go/bin/linux_amd64/go
			rmdir $pkgdir/go/bin/linux_amd64
	fi
	rmdir $pkgdir/go/bin
	rmdir $pkgdir/go

	# Linux  packages.
  if [ "$CARCH" == 'x86_64' ]; then
			mkdir -p $pkgdir/usr/lib/go/pkg/tool/linux_amd64
			cp -a pkg/tool/linux_amd64/8* $pkgdir/usr/lib/go/pkg/tool/linux_amd64
			cp -a pkg/linux_386 $pkgdir/usr/lib/go/pkg
			cp -a pkg/tool/linux_386 $pkgdir/usr/lib/go/pkg/tool
  elif [ "$CARCH" == 'i686' ]; then
			mkdir -p $pkgdir/usr/lib/go/pkg/tool/linux_386
			cp -a pkg/tool/linux_386/6* $pkgdir/usr/lib/go/pkg/tool/linux_386
			cp -a pkg/linux_amd64 $pkgdir/usr/lib/go/pkg
			cp -a pkg/tool/linux_amd64 $pkgdir/usr/lib/go/pkg/tool
  fi
}

# vim:set ts=2 sw=2 et:
