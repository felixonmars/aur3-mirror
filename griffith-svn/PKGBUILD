# $Id: PKGBUILD 78191 2012-10-17 10:23:55Z allan $
# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
# Contributor: Pawel Rusinek <p.rusinek@gmail.com>
# Contributor: Otakar Haska <ota.haska@seznam.cz>

pkgname=griffith-svn
pkgver=1659
pkgrel=1
pkgdesc="Movie collection manager application"
arch=('any')
url="http://griffith.berlios.de"
license=('GPL2')
depends=('pygtk>=2.14.1' 'sqlite' 'python2-pysqlite' \
         'python2-reportlab>=2.3' 'python2-pillow' 'pyxml' 'python2-sqlalchemy')
optdepends=('python2-psycopg2: postgreSQL support'
            'mysql-python: MySQL support'
            'python2-chardet: encoding detection of imported CSV files'
            'gnome-python-extras: spell checking support'
            'griffith-extra-artwork: additional icons')
makedepends=('subversion' 'awk')
provides=('griffith')
conflicts=('griffith')

_svntrunk=http://svn.berlios.de/svnroot/repos/griffith/trunk
_svnmod=griffith

pkgver() {
  cd "$srcdir/$_svnmod"
  svn info $_svntrunk | grep Revision | awk '{print $2}'
}

build() {

  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

 
  # python2 fix
  sed -i 's_#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' griffith

  # new bash_completion directory
  #sed -e 's,BASHCOMPDIR = $\(ETCDIR\)/bash_completion.d,BASHCOMPDIR = $\(PREFIX\)/share/bash-completion/completions,' -i Makefile
  sed -e 's,BASHCOMPDIR = $(ETCDIR)/bash_completion.d,BASHCOMPDIR = $(PREFIX)/share/bash-completion/completions,' -i Makefile
}

package() {
  cd "$srcdir/$_svnmod-build"

  make DESTDIR=${pkgdir} install

  # The program creates a wrong symlink so make a new one
  rm ${pkgdir}/usr/bin/griffith
  ln -s /usr/share/griffith/lib/griffith ${pkgdir}/usr/bin/griffith 
}