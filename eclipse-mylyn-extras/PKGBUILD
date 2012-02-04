# Contributor: Jonathan Wiersma <archaur at jonw dot org>
pkgname=eclipse-mylyn-extras
pkgver=3.3.3
_reldate=20100330-0100
pkgrel=2
pkgdesc="Support for additional task repositories in Mylyn $pkgver for Eclipse"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/mylyn/"
license=('EPL')
depends=("eclipse-mylyn=$pkgver")
conflicts=("eclipse-mylyn>$pkgver")
optdepends=("trac")
_mirror="http://mirror.csclub.uwaterloo.ca/eclipse"
noextract=($pkgname-$pkgver.zip)
source=("$pkgname-$pkgver.zip::$_mirror/tools/mylyn/update-archive/$pkgver/v$_reldate/mylyn-$pkgver.v$_reldate-extras.zip")

build() {
  # Extract archive
  mkdir -p $srcdir/eclipse || return 1
  cd $srcdir/eclipse || return 1
  jar xf $srcdir/$pkgname-$pkgver.zip || return 1
}

package() {
  cd $srcdir/eclipse || return 1
  _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse
  
  # Unjar features and install (ignore packed jars)
  find features -type f | while read _feature ; do
    if [[ ${_feature} =~ (.*\.jar$) ]] ; then
      install -dm755 ${_dest}/${_feature%\.jar} || return 1
      pushd ${_dest}/${_feature%\.jar} >/dev/null || return 1
      jar xf ${srcdir}/eclipse/${_feature} || return 1
      popd >/dev/null || return 1
    elif [[ ! ${_feature} =~ (.*\.jar.pack.gz) ]] ; then
      install -Dm644 $_file $_dest/$_file || return 1
    fi
  done || return 1
  
  find * -type f -regextype posix-extended \
    -not -path "features/*" \
    -not -regex "plugins/.*\.jar\.pack\.gz" \
      | while read _file ; do
        install -Dm644 $_file $_dest/$_file || return 1
      done || return 1
}

md5sums=('84aa0457d57413a427b9b4f30b890ea6')
