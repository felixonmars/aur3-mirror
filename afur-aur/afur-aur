#!/bin/sh

makepkg -f --config /usr/share/afur-aur/makepkg.conf32 ||return 1
makepkg -f --config /usr/share/afur-aur/makepkg.conf64 ||return 1
makepkg --source -f ||return 1

pack=`grep ^pkgname= PKGBUILD |  sed "s/pkgname=//"`;
ver=`grep ^pkgver= PKGBUILD |  sed "s/pkgver=//"`;
rel=`grep ^pkgrel= PKGBUILD |  sed "s/pkgrel=//"`;

source=${pack}-${ver}-${rel}.src.tar.gz

aurploader  -l ~/.aurlogconf $source &&

if grep arch PKGBUILD | grep -q i686 ;  then
        packa=${pack}-${ver}-${rel}-i686.pkg.tar.xz
	afur-makepkg  -s $packa $source
fi

if grep arch PKGBUILD | grep -q x86_64 ;  then
        packa=${pack}-${ver}-${rel}-x86_64.pkg.tar.xz
	afur-makepkg  -s $packa $source
fi

if grep arch PKGBUILD | grep -q any ;  then
        packa=${pack}-${ver}-${rel}-any.pkg.tar.xz
	afur-makepkg  -s $packa $source
fi
