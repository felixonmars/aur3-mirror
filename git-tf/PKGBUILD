# Maintainer: Matt.Peterson <ricochet1k@gmail.com>
pkgname='git-tf'
pkgver=2.0.2.20130214
pkgrel=1
pkgdesc="A set of cross-platform, command line tools that facilitate sharing of changes between TFS and Git."
arch=('i686' 'x86_64')
url='http://gittf.codeplex.com'
license=('MIT')
depends=('sh' 'java-environment>=6')
makedepends=()
source=("http://download.microsoft.com/download/A/E/2/AE23B059-5727-445B-91CC-15B7A078A7F4/git-tf-$pkgver.zip"
        'git-tf.sh')
md5sums=('616f062638cf5c873dfb354297ea45eb'
         'e2236fa60c28f25f1933caafb67e20da')


prepare() {
    cd "git-tf-$pkgver"
    # Apply patches
    for _p in "$srcdir"/*.patch; do
        [[ -e $_p ]] || continue
        msg2 "Appy patch ${_p##*/}"
        patch -Np1 -i "$_p"
    done
}

build() {
    cd "git-tf-$pkgver"
    
    # remove useless natives
    rm -r native/{aix,hpux,macosx,solaris,win32}
}

package() {
  cd "$srcdir"

  install -dm755 "${pkgdir}/opt"
  cp --preserve=mode -r "git-tf-$pkgver" "${pkgdir}/opt/git-tf"
  cp --preserve=mode "git-tf.sh" "${pkgdir}/opt/git-tf/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/git-tf/git-tf.sh" "${pkgdir}/usr/bin/git-tf"
}

# vim:set ts=4 sw=4 et:
