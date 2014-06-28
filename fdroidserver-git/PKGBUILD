# Maintainer Daniel Landau <daniel.landau@iki.fi>
# Contributor: Prurigro
# Ported from the package by AlexanderR <alexander r at gmx com>

_pkgname=fdroidserver
pkgname=${_pkgname}-git
pkgver=r2667.0ee6fc8
pkgrel=1
pkgdesc="F-Droid repository management tools"
url="https://gitlab.com/fdroid/$_pkgname"
license=('GPL3')
depends=('python2'  )
makedepends=('git' 'python2-setuptools' 'python2-magic' 'python2-pillow' 'java-environment')
optdepends=(
     'android-sdk-build-tools: Work with binary/source apps (needed for a binary repo)'
     'java-runtime: Run a repository'
     'android-sdk: Build source apps'
     'android-ndk: Build source apps with native code'
     'apache-ant: Build source apps'
     'maven: Build source apps'
     'gradle: Build source apps'
     'android-support-repository: Build source apps with maven/gradle that depend on support libraries'
     'svn: Update app sources'
     'mercurial: Update app sources'
     'bzr: Update app sources'
     'git: Update app sources'
     'python2-magic: Work with app icons'
     'python2-pillow: Work with app icons'
     'android-sdk-platform-tools: Install app to device with adb'
     )
arch=('any')
options=(!emptydirs)
source=("git+https://gitlab.com/fdroid/fdroidserver.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${_pkgname}"

    python2 setup.py install --root="$pkgdir/" --optimize=1 --install-data="/tmp" || true
    rm -rf "$pkgdir/tmp"

    cd ${_pkgname}/getsig
    javac getsig.java
    mkdir -p "$pkgdir/usr/lib/python2.7/site-packages/${_pkgname}/getsig/"
    install getsig.class "$pkgdir/usr/lib/python2.7/site-packages/${_pkgname}/getsig/getsig.class"
    cd -

    mkdir -p "$pkgdir/usr/bin"
    install "fdroid" "$pkgdir/usr/bin"
    install "fd-commit" "$pkgdir/usr/bin"

    install -D completion/bash-completion "$pkgdir/usr/share/bash-completion/completions/fdroidserver"

    install -D "examples/config.py" "$pkgdir/usr/share/$_pkgname/config.sample.py"
}
