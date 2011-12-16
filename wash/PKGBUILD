# $Id$
# Maintainer: Martin Špelina < shpelda at gmail dot com > 

pkgname=wash
_basever=4.2
_patchlevel=020 #prepare for some patches
pkgver=$_basever.$_patchlevel.1027bb
pkgrel=1
pkgdesc="The GNU Bourne Again shell with whispering patch"
arch=('i686' 'x86_64')
license=('GPL')
url="http://code.google.com/p/bash-whispering"
#groups=('base')
depends=('bash' 'glibc')
#provides=('sh')
source=(http://ftp.gnu.org/gnu/bash/bash-$_basever.tar.gz{,.sig}
        0001-First-usable-whispering-version.patch)
if [ $_patchlevel -gt 000 ]; then
    for (( p=1; p<=$((10#${_patchlevel})); p++ )); do
        source=(${source[@]} http://ftp.gnu.org/gnu/bash/bash-$_basever-patches/bash${_basever//./}-$(printf "%03d" $p){,.sig})
    done
fi

build() {
  cd ${srcdir}/bash-$_basever
  for (( p=1; p<=$((10#${_patchlevel})); p++ )); do
    msg "applying patch bash${_basever//./}-$(printf "%03d" $p)"
    patch -Np0 -i $srcdir/bash${_basever//./}-$(printf "%03d" $p)
  done

  patch -p2 -i $srcdir/0001-First-usable-whispering-version.patch 

  _bashconfig=(-DDEFAULT_PATH_VALUE=\'\"/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin\"\'
               -DSTANDARD_UTILS_PATH=\'\"/usr/bin:/bin:/usr/sbin:/sbin\"\'
               -DSYS_BASHRC=\'\"/etc/bash.bashrc\"\'
               -DSYS_BASH_LOGOUT=\'\"/etc/bash.bash_logout\"\')
  export CFLAGS="${CFLAGS} ${_bashconfig[@]}"

  ./configure --prefix=/usr --bindir=/bin --mandir=/usr/share/man --infodir=/usr/share/info
  make
#    --with-curses --enable-readline \
#    --without-bash-malloc \
# --with-installed-readline 
}

check() {
  cd ${srcdir}/bash-$_basever
  make check
}

package() {
  cd ${srcdir}/bash-$_basever
  make DESTDIR=${pkgdir} install
  rm -rf $pkgdir/usr
  rm -rf $pkgdir/bin/bashbug
  mv $pkgdir/bin/bash $pkgdir/bin/wash
}

md5sums=('3fb927c7c33022f1c327f14a81c0d4b0'
         '8d37a3f97a48c1e56e1a4ded877ed944'
         'dc710356464aa600d124ef74f8f739b1'
         '1100bc1dda2cdc06ac44d7e5d17864a3'
         'a7184b76eb4a079f10174a0a8f574819'
         '30e7948079921d3261efcc6a40722135'
         'c4d45307f7e69fe508ce347c4cec1955'
         '9ea06decec43a198f3d7cf29acc602f8'
         '74bddae6eeb9227a04a467d42597a34d'
         'fb48f6134d7b013135929476aa0c250c'
         '3e6a18226b16c773229246abd07a1f5e'
         'e70e45de33426b38153b390be0dbbcd4'
         'e667dc9348ebc3e0e14bfdd87f4b6ff2'
         'ce4e5c484993705b27daa151eca242c2'
         '41cbd8e57589bc081a546a014ddb12f8'
         '88d1f96db29461767602e2546803bda7'
         'b8b781520f4c7493a2a1ac3010a44a44'
         '24c574bf6d6a581e300823d9c1276af6'
         '354a0899a7c4b446454c52546562b55b'
         '4c5835f2fbab36c4292bb334977e5b6d'
         'ff4547ca7b508d52101729d61f5b77b6'
         '0a51602b535ef661ee707be6c8bdb373'
         'cec7c92a4d8052ea4b29216365d16566'
         '58deacf3d57cbd75575444ff6a3b0806'
         '9ed2a08e549c3c17745f19e8413cfb31'
         '72d5059820015231483bb7415d09e9db'
         '45b04b41a4230f469d3e47ab9952c2df'
         '608336ebe215984ef126e3c29d2d3409'
         '623f63025d155a84977b62531e260ee2'
         'ed19da878e3f630834c62b9d9dcc6fce'
         'eef2dd4a0e4505dc8f8e664b40c6cd66'
         '2d07daba0b8ca8f876d2aa052ff594b4'
         '0cb823a44e6dc1cde7ac97ae5c8163c9'
         '53d246537e1fffd1aaa02ba5c056211c'
         '60f983a1dded5f0b28040ff4b3f1e9b5'
         '304fd129a58fee2d8a34f8b4704db0aa'
         '9df4bf4f46aaadc436f430187741f815'
         '6921a0b4228fe89b6537a5c29f027c89'
         '4ef0e2a2cbfbdd53346f927000b7e112'
         '1195d85447f3d048d2c9bcd075fa765c'
         'b0f3a651ce29a1feee687d93177870f1'
         'b09000bba08da6ac753124593850cdf7'
         '204bb5054d1f8bafe2b446d4e5d0d99a') 
