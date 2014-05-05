# Contributor: Mike Redd <mredd -at- zerotuezero dot com>

pkgname=bash-completion-adb
pkgver=20140323
pkgrel=2.3
pkgdesc='Bash completions by Roman Urik for Android SDK Tool adb'
arch=('any')
url="https://code.google.com/p/romannurik-code/source/browse/bash_completion/adb"
license=('Apache')
depends=('bash' 'android-sdk' 'git')
makedepends=('curl')
conflicts=('bash-completion-android')
install=
source=()
md5sums=()

_gitroot="https://code.google.com/p/romannurik-code/"
_gitname="romannurik-code"
_buildir="${_gitname}-build"

build() {
     cd ${srcdir}

     msg 'Connecting to GIT server...'

     if [ -d ${_gitname} ]; then
          cd ${_gitname} && git pull origin
          cd ..
     else
          git clone ${_gitroot}
     fi

     msg 'GIT checkout done or server timeout.'

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
     # dump just license from the readme
     curl http://www.apache.org/licenses/LICENSE-2.0 -o LICENSE
     install -d $pkgdir/usr/share/bash-completion/completions/
     install -m 0755 romannurik-code/bash_completion/adb $pkgdir/usr/share/bash-completion/completions/adb
     install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}

# vim:syntax=sh
