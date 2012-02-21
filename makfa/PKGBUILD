# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=makfa
pkgver=20091212
pkgrel=3
pkgdesc="A dependency-light (Python) single-file command-line makfa Lojban dictionary."
arch=('any')
url="https://github.com/lojban/makfa-cli"
license=("unknown")
depends=('python2')
# I know it's ugly, but the project hasn't been updated since 2009.
# When development resumes, I'll make a proper git package ;)
source=("https://github.com/dag/makfa-cli/raw/master/makfa")
md5sums=('ec2e19553d874d0a3011c2831465f998')

package() {
  cd "$srcdir"
  
  # python -> python2 fix
  sed -i '1c#!/usr/bin/env python2' makfa
  
  # avoids warnings when updating dictionary
  sed -i -e "s#//valsi#.//valsi#g" -e "s#//nlword#.//nlword#g" makfa

  install -Dm 755 makfa "${pkgdir}/usr/bin/makfa"
}

# vim:set ts=2 sw=2 et:
