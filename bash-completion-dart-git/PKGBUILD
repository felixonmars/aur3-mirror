# Maintainer: Claudio d'Angelis <claudiodangelis at gmail dot com>

pkgname=bash-completion-dart-git
pkgver=20140825
pkgrel=0.1
pkgdesc="Bash completion for Dart SDK binaries"
arch=('any')
url="https://github.com/claudiodangelis/dart-bash_completion"
license=('Apache')
depends=('bash' 'git')
conflicts=()
install=
source=("git+https://github.com/claudiodangelis/dart-bash_completion.git")

md5sums=('SKIP')
sha256sums=('SKIP')

_gitroot="git://github.com/claudiodangelis/dart-bash_completion.git"
_gitname="dart-bash_completion"
_buildir="${_gitname}-build"

build() {
     cd ${srcdir}

     msg 'Connecting to Git server...'

     if [ -d ${_gitname} ]; then
          cd ${_gitname} && git pull origin
          cd ..
     else
          git clone ${_gitroot}
     fi

     msg 'Git checkout done or server timeout.'

     if [ -d ${_buildir} ]; then
          msg 'Cleaning previous build...'
          rm -rf ${_buildir}
     fi

     git clone ${_gitname} ${_buildir}
     cd ${_buildir}
 }

 package() {
     msg 'Creating package build...'
     cd $srcdir
     install -d $pkgdir/usr/share/bash-completion/completions
     install -m 0755 dart-bash_completion-build/dart $pkgdir/usr/share/bash-completion/completions/dart
     install -m 0755 dart-bash_completion-build/dart2js $pkgdir/usr/share/bash-completion/completions/dart2js
     install -m 0755 dart-bash_completion-build/dartanalyzer $pkgdir/usr/share/bash-completion/completions/dartanalyzer
     install -m 0755 dart-bash_completion-build/dartfmt $pkgdir/usr/share/bash-completion/completions/dartfmt
     install -m 0755 dart-bash_completion-build/pub $pkgdir/usr/share/bash-completion/completions/pub
     install -m 0755 dart-bash_completion-build/docgen $pkgdir/usr/share/bash-completion/completions/docgen
     install -Dm644 dart-bash_completion-build/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
