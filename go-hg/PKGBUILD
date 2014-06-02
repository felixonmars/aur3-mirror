# Maintainer: John K Luebs <jkl johnluebs.com>
# Contributor: Daniel YC Lin <dlin.tw gmail>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: Rémy Oudompheng  <remy@archlinux.org>
# Contributor: Andres Perera <andres87p gmail>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>
# Contributor: Christian Himpel <chressie@gmail.com>
# Contributor: Mike Rosset <mike.rosset@gmail.com>

# Report problems on AUR, or github: https://github.com/jkl1337/packages-archlinux

pkgname=go-hg
pkgver=20083.230e
pkgrel=1
pkgdesc='Google Go compiler support multi-platforms(hg tip)'
# ref valid platforms http://golang.org/doc/install/source#environment
_platforms="linux_arm windows_386"
if [ "$CARCH" == 'x86_64' ]; then
    _platforms="linux_amd64 $_platforms"
    export GOARCH=amd64
elif [ "$CARCH" == 'i686' ]; then
    _platforms="linux_386 $_platforms"
fi
_tools="vet cover"
conflicts=('go')
provides=('go=1.2')
arch=('x86_64' 'i686')
url='http://golang.org/'
license=('custom')
depends=('perl' 'gawk')
makedepends=('inetutils' 'mercurial' 'git')
options=('!strip')
install='go.install'
source=('go::hg+https://go.googlecode.com/hg' 'go.sh')
md5sums=('SKIP'
         'd4444874ff1ae3c3cbeea042a75a530b')

pkgver() {
  cd "$srcdir/go"
  local _id=$(hg identify -i)
  echo $(hg identify -n).${_id:0:4}
}

build() {
  cd "$srcdir/go/src"

  export GOROOT=$srcdir/go
  export GOROOT_FINAL=/usr/lib/go
  export GOPATH="$srcdir/"
  local n=0
  # export GOARM=5 # if without FPU
  for platform in $_platforms ; do
    n=$((n+1))
    export GOOS=${platform%%_*}
    export GOARCH=${platform##*_}
    msg2 "building $GOOS $GOARCH"
    bash make.bash --no-clean
    if [ $n -eq 1 ] ; then
      $srcdir/go/bin/go get -d code.google.com/p/go.tools/cmd/godoc
      $srcdir/go/bin/go build -o $srcdir/godoc code.google.com/p/go.tools/cmd/godoc
      for tool in $_tools ; do
        $srcdir/go/bin/go get -d code.google.com/p/go.tools/cmd/$tool
        $srcdir/go/bin/go build -o $srcdir/go/pkg/tool/$platform/$tool code.google.com/p/go.tools/cmd/$tool
      done
    fi
  done
}

check() {
  cd "$srcdir/go"

  # Only test for linux and the architecture we're on
  export GOOS=linux
  if [ "$CARCH" == 'x86_64' ]; then
    export GOARCH=amd64
  elif [ "$CARCH" == 'i686' ]; then
    export GOARCH=386
  else
    export GOARCH=arm
  fi

  export GOROOT="$srcdir/go"
  export PATH="$srcdir/go/bin:$PATH"
  export GOPATH="$srcdir/"

  mkdir -p hello
  cd hello
  echo "package main; import \"runtime\"; func main() { println(runtime.Version())}" > hello.go
  for platform in $_platforms ; do
    msg2 "checking GOOS=${platform%%_*} GOARCH=${platform##*_} go build"
    GOOS=${platform%%_*} GOARCH=${platform##*_} $srcdir/go/bin/go build
    msg2 "checking GOOS=${platform%%_*} GOARCH=${platform##*_} go get"
    GOOS=${platform%%_*} GOARCH=${platform##*_} $srcdir/go/bin/go get -u github.com/nsf/gocode
  done
  cd ..

  # TestSimpleMulticastListener will fail in standard chroot.
  # I don't know how to skip only specific test
  #cd src && bash run.bash --no-rebuild || true
}

package() {
  cd "$srcdir/go"
  export GOROOT="$srcdir/go"

  install -Dm755 $srcdir/godoc $pkgdir/usr/bin/godoc

  install -Dm644 LICENSE \
    $pkgdir/usr/share/licenses/go-hg/LICENSE
  install -Dm644 misc/bash/go \
    $pkgdir/usr/share/bash-completion/completions/go
  install -Dm644 misc/emacs/go-mode-load.el \
    $pkgdir/usr/share/emacs/site-lisp/go-mode-load.el
  install -Dm644 misc/emacs/go-mode.el \
    $pkgdir/usr/share/emacs/site-lisp/go-mode.el
  install -Dm644 misc/zsh/go \
    $pkgdir/usr/share/zsh/site-functions/_go

  for f in ftdetect/gofiletype.vim autoload/go/complete.vim indent/go.vim \
    ftplugin/go/fmt.vim ftplugin/go/import.vim syntax/go.vim syntax/godoc.vim \
    plugin/godoc.vim;
  do
    install -Dm644 misc/vim/$f $pkgdir/usr/share/vim/vimfiles/$f
  done

  mkdir -p $pkgdir/{etc/profile.d,usr/{share/go,lib/go,lib/go/src}}

  cp -r doc misc -t $pkgdir/usr/share/go
  ln -s /usr/share/go/doc $pkgdir/usr/lib/go/doc
  cp -a bin $pkgdir/usr
  cp -a pkg $pkgdir/usr/lib/go
  cp -a $GOROOT/src/pkg $pkgdir/usr/lib/go/src/
  cp -a $GOROOT/src/cmd $pkgdir/usr/lib/go/src/cmd
  cp -a $GOROOT/src/lib9 $pkgdir/usr/lib/go/src/
  cp -a $GOROOT/lib $pkgdir/usr/lib/go/
  cp -a $GOROOT/include $pkgdir/usr/lib/go/

  install -Dm644 src/Make.* $pkgdir/usr/lib/go/src

  # Remove object files from target src dir
  find $pkgdir/usr/lib/go/src/ -type f -name '*.[ao]' -delete

  # Fix for FS#32813
  find $pkgdir -type f -name sql.go -exec chmod -x {} \;

  # Remove all executable source files
  find $pkgdir/usr/lib/go/src/pkg -type f -executable -delete

  # Headers for C modules
  install -Dm644 src/pkg/runtime/runtime.h \
    $pkgdir/usr/lib/go/src/pkg/runtime/runtime.h
  install -Dm644 src/pkg/runtime/cgocall.h \
    $pkgdir/usr/lib/go/src/pkg/runtime/cgocall.h

  # For packages that source /etc/profile.d/go.sh
  install -Dm755 $srcdir/go.sh $pkgdir/etc/profile.d/go.sh

  # This is to make go get code.google.com/p/go-tour/gotour and
  # then running the gotour executable work out of the box.
  ln -sf /usr/bin $pkgdir/usr/lib/go/bin

  # For godoc
  install -Dm644 favicon.ico $pkgdir/usr/lib/go/favicon.ico

  rm -f $pkgdir/usr/share/go/doc/articles/wiki/get.bin

  install -Dm644 VERSION.cache $pkgdir/usr/lib/go/VERSION

  # Clean up
  for platform in $_platforms ; do
    if [ $CARCH = i686  -a $platform = linux_386 ] ; then
      continue
    elif [ $CARCH = x86_64  -a $platform = linux_amd64 ] ; then
      continue
    fi
    rm -r "$pkgdir/usr/bin/$platform"
    rm -r "$pkgdir/usr/lib/go/pkg/tool/$platform"
  done

  msg2 "strip binary files"
  local binary strip_flags
  find $pkgdir/usr/bin -type f -perm -u+w -print0 2>/dev/null | while read -d '' binary ; do
    case "$(file -bi "$binary")" in
      *application/x-sharedlib*)  # Libraries (.so)
        strip_flags="$STRIP_SHARED";;
      *application/x-archive*)    # Libraries (.a)
        strip_flags="$STRIP_STATIC";;
      *application/x-executable*) # Binaries
        strip_flags="$STRIP_BINARIES";;
      *)
        continue ;;
    esac
    strip_file "$binary" ${strip_flags}
  done

  msg2 "changelog(last 10)"
  (cd  $srcdir/go ; \
    hg log -l 10 --template '{rev} {node|short} {date|shortdate} {desc|firstline}\n' ; \
    true )
}

# vim:set ts=2 sw=2 et:
