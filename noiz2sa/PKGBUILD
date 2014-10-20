# Contributor: Nick B <Shirakawasuna at gmail _dot_ com>
# Maintainer: Anntoin Wilkinson <anntoin@gmail.com>

pkgname=noiz2sa
pkgver=0.51a
pkgrel=6
pkgdesc="An addictive game by Kenta Cho.  Classic shoot-em-up with an older, abstract feel"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/noiz2sa/"
license=('custom')
depends=('libbulletml' 'sdl_mixer')
options=('!buildflags' '!makeflags')
source=('http://abagames.sakura.ne.jp/windows/noiz2sa0_51.zip'
	      'noiz2sa_0.51a-9_mod.diff.gz'
	      'archpatch_noiz2sa-1.diff'
        'launch' )
md5sums=('f8c968fd92031d425652e3525d266f9a'
         '4fda82e5d9c93db198dd7069193f1b53'
         'd766bb46d84d8c9b66e263ab84a31787'
         'a202a10fa8a1d58d6a122a52cf23b2b9')

build() {
  cd ${srcdir}/${pkgname}

  sed -i 's:noiz2sa-0.51a\/:noiz2sa\/:' ../noiz2sa_0.51a-9_mod.diff

  patch -p1 <../noiz2sa_0.51a-9_mod.diff
  patch -p1 <../archpatch_noiz2sa-1.diff

  sed -i 's:\/games::'        ./src/screen.c          \
                              ./src/barragemanager.cc \
                              ./src/soundmanager.c
  sed -i 's:\/usr\/games\/::' ./debian/noiz2sa.desktop


  cd src

  make
}

package() {
  cd ${srcdir}/${pkgname}

  # Install binaries
  install -D -m755 ../launch ${pkgdir}/usr/bin/${pkgname}
  install -D -m755 ./src/${pkgname} ${pkgdir}/opt/${pkgname}/${pkgname}

  # Install other resources
  find {boss,images,middle,sounds,zako} -type f -exec install -Dm644 {} ${pkgdir}/opt/${pkgname}/{} \;

  # Install man page and debian copyright notice
  install -D -m644 ./debian/${pkgname}.6 ${pkgdir}/usr/share/man/man6/${pkgname}.6
  install -D -m644 ./debian/copyright ${pkgdir}/usr/share/licenses/${pkgname}/copyright

  # Install desktop file and icon
  install -D -m644 ./debian/noiz2sa.desktop ${pkgdir}/usr/share/applications/noiz2sa.desktop
  install -D -m644 ./debian/noiz2sa.xpm ${pkgdir}/usr/share/pixmaps/noiz2sa.xpm
}

# vim:set ts=2 sw=2 et:
