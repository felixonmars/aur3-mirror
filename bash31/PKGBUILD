# Maintainer: Samuel Dionne-Riel <samuel@dionne-riel.com>

_bash_version="3.1"
pkgname=bash31
_patchlevel=017
pkgver=${_bash_version}.$_patchlevel
pkgrel=2
pkgdesc="The GNU Bourne Again shell"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnu.org/software/bash/bash.html"
groups=('base')
#This is not your system bash.
#backup=(etc/profile.bash etc/skel/.bashrc etc/skel/.bash_profile)
depends=('readline>=5.2' 'glibc')

#This would cause a conflict
#provides=('sh')
source=(http://ftp.gnu.org/gnu/bash/bash-${_bash_version}.tar.gz
        bash-noinfo.patch bash${_bash_version/.}.rc bash${_bash_version/.})

md5sums=('ef5304c4b22aaa5088972c792ed45d72'
         'f2a3cf51e58f9b82af50b861191d96fd'
         'eb7361b4e9b659d20dca1281287a8e2f'
         'cd470742fd7839b9ca5c074d2b4a202a'
         'c0d33bdfed6e4e6a9ae9200b77cd5c99'
         '0c9be3bad344d04b79c4eac9eb39624c'
         '04750485f335972f7a980a1bfe048dba'
         '0c2856794ab16a4c224223c1964140c2'
         '943233d7227071fa040c8b9eb016fa0c'
         '68a41a9da7c669b4358837d06556a06f'
         'f6ca4950256fefd88d49c5702338e501'
         '4fd01140cb5875fe020939aab02791f0'
         '37aad0d5aa57881742ec6419faf9e480'
         '91c52d2a51d41d4b6907758952aa0554'
         '37ace691fc4bd386fb764b5f53cde4a1'
         'cd5d17f0729a6da39a60039f2730e408'
         '31317d6a80bed2eb9b6fd3d12d304259'
         '7f4aef181659265d822c48e774834975'
         '1c05456b278235f578009b8fb2454a9a'
         'fbc981edfff97a0940487937db3fb202'
         'b08ffabafce3a967e3a7e0a5b29d8331')

for p in $(seq -w 001 $_patchlevel); do
    source=(${source[@]} http://ftp.gnu.org/gnu/bash/bash-${_bash_version}-patches/bash${_bash_version/.}-$p)
done


build() {
  cd ${startdir}/src/bash-${_bash_version}
  for p in ../bash${_bash_version/.}-*; do
    msg "applying patch ${p}"
    patch -Np0 -i ${p} || return 1
  done
  patch -Np1 -i ../bash-noinfo.patch || return 1

  ./configure --prefix=/opt/bash${_bash_version/.}/ --with-curses --enable-readline \
    --without-bash-malloc --with-installed-readline
  make || return 1
  make DESTDIR=${startdir}/pkg install

  install -D -m755 ${startdir}/src/bash${_bash_version/.} ${startdir}/pkg/usr/bin/bash${_bash_version/.}

  install -D -m644 $startdir/src/bash${_bash_version/.}.rc $startdir/pkg/opt/bash${_bash_version/.}/bash${_bash_version/.}.rc
}

# vim:set ts=2 sw=2 et:
